package com.example.client

import io.flutter.app.FlutterApplication
import io.flutter.plugin.common.PluginRegistry
import io.flutter.plugin.common.PluginRegistry.PluginRegistrantCallback
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin
import io.flutter.view.FlutterMain
import rekab.app.background_locator.IsolateHolderService

class Application : FlutterApplication(), PluginRegistrantCallback {
    override fun onCreate() {
        super.onCreate()
        IsolateHolderService.setPluginRegistrant(this)
        FlutterMain.startInitialization(this)
    }
    
    override fun registerWith(registry: PluginRegistry?) {
       if (!registry!!.hasPlugin("io.flutter.plugins.sharedpreferences")) {
            SharedPreferencesPlugin.registerWith(registry!!.registrarFor("io.flutter.plugins.sharedpreferences"))
        }
    }
}