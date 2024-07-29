package com.example.apis_app;

import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Handler;
import android.telephony.SmsManager;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import android.Manifest;
import android.widget.Toast;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private static final int MY_PERMISSIONS_REQUEST_SEND_SMS = 0;

    private int count = 0;
    private TextView textView;
    private Button start;
    private Button stop;
    private int mInterval = 5000; // 5 seconds
    private Handler mHandler;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Check if the SEND_SMS permission is already available.
        if (ContextCompat.checkSelfPermission(this, Manifest.permission.SEND_SMS)
                != PackageManager.PERMISSION_GRANTED) {
            // If permission is not granted, request it.
            ActivityCompat.requestPermissions(this,
                    new String[]{Manifest.permission.SEND_SMS},
                    MY_PERMISSIONS_REQUEST_SEND_SMS);
        }

        mHandler = new Handler();

        textView = findViewById(R.id.SMS_Text);
        textView.setText("Sent SMS Messages: " + count);

        start = (Button)findViewById(R.id.start);
        stop = (Button)findViewById(R.id.stop);

        start.setEnabled(true);
        stop.setEnabled(false);

        start.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startRepeatingTask();
                start.setEnabled(false);
                stop.setEnabled(true);
            }
        });

        stop.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                stopRepeatingTask();
                start.setEnabled(true);
                stop.setEnabled(false);
            }
        });
    }

    @Override
    public void onRequestPermissionsResult(int requestCode,
                                           String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        switch (requestCode) {
            case MY_PERMISSIONS_REQUEST_SEND_SMS: {
                // If request is cancelled, the result arrays are empty.
                if (grantResults.length > 0
                        && grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                    // Permission granted, proceed with your SMS sending logic
                } else {
                    // Permission denied, disable the functionality that depends on this permission.
                    Toast.makeText(this, "SMS permission denied.", Toast.LENGTH_SHORT).show();
                }
                return;
            }
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        stopRepeatingTask();
    }

    Runnable mStatusChecker = new Runnable() {
        @Override
        public void run() {
            try {
                new AsyncTaskExample().execute();
            } finally {
                mHandler.postDelayed(mStatusChecker, mInterval);
            }
        }
    };

    void startRepeatingTask() {
        mStatusChecker.run();
    }

    void stopRepeatingTask() {
        mHandler.removeCallbacks(mStatusChecker);
    }

    private class AsyncTaskExample extends AsyncTask<Void, Void, ArrayList<String> > {
        @Override
        protected ArrayList<String> doInBackground(Void... voids) {
            ArrayList<String> message_info = new ArrayList<String>();

            try {
                URL url = new URL("http://192.168.146.94:8080/getSMS");

                HttpURLConnection http = (HttpURLConnection) url.openConnection();
                http.setRequestMethod("GET");
                http.connect();

                InputStream inputStream = http.getInputStream();
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));

                String line = "";
                String data = "";

                while ((line = bufferedReader.readLine()) != null) {
                    data = data + line;
                }

                if (!data.equals("No Messages Found")) {
                    count = count + 1;
                    JSONObject Obj = new JSONObject(data);
                    String message = Obj.getString("body");
                    String number = Obj.getString("phone");

                    message_info.add(number);
                    message_info.add(message);
                }

                inputStream.close();
                bufferedReader.close();
                http.disconnect();

            } catch (Exception e) {
                e.printStackTrace();
            }

            return message_info;
        }

        @Override
        protected void onPostExecute(ArrayList<String> message_info) {
            super.onPostExecute(message_info);

            if(!message_info.isEmpty()){
                textView.setText("Sent SMS Messages: " + count);

                SmsManager smsManager = SmsManager.getDefault();
                smsManager.sendTextMessage(message_info.get(0),
                        null,
                        message_info.get(1),
                        null,
                        null);

//               // Add the phone number in the data
//                Uri uri = Uri.parse("smsto:" + message_info.get(0));
//                // Create intent with the action and data
//                Intent smsIntent = new Intent(Intent.ACTION_SENDTO, uri);
//                // Set the message
//                smsIntent.putExtra("sms_body", message_info.get(1));
//                startActivity(smsIntent);
            }
            else {
                Log.d("data", "No Messages Found");
            }

        }

    }
}