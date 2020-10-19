package com.example.contactapp

import androidx.annotation.NonNull;

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterFragmentActivity() {
            
override fun configureFlutterEngine(@NonNull FlutterEngine: FlutterEngine){
            GeneratedPluginRegistrant.registerWith(FlutterEngine);
}


}
