package com.mangosoft.lotame.plugin;

import com.getcapacitor.JSObject;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

import java.io.IOException;
import java.util.concurrent.TimeUnit;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;

import com.lotame.android.CrowdControl;
import com.lotame.android.CrowdControl.Protocol;

import android.content.Context;

import org.json.JSONException;
import org.json.JSONObject;

@CapacitorPlugin(name = "MangoSoftLotame")
public class MangoSoftLotamePlugin extends Plugin {
    private Context thisContext;

    private static final int TIMEOUT_MILLIS = 5000;
    private CrowdControl ccHttp;
    private CrowdControl ccHttps;

    private MangoSoftLotame implementation = new MangoSoftLotame();

    @Override
    public void load() {
        thisContext = getContext();
    }

    @PluginMethod
    public void echo(PluginCall call) {
        String value = call.getString("value");

        JSObject ret = new JSObject();
        ret.put("value", implementation.echo(value));
        call.resolve(ret);
    }

    /**
     * Initialize Lotame.
     *
     * @param call clientId: Lotame Client ID
     */
    @SuppressLint("LongLogTag")
    @PluginMethod
    public void initialize(PluginCall call) {
        String clientIdStr = call.getString("clientId");
        Integer clientId = null;
        JSObject ret = new JSObject();

        if (clientIdStr == null) {
            // call.reject("Must provide a Client ID");
            ret.put("message", implementation.echo("Must provide a Client ID"));
            call.resolve(ret);
            return;
        } else {
            clientId = Integer.parseInt(clientIdStr);
        }

        ccHttp = new CrowdControl(thisContext, clientId);

        Log.d("Lotame plugin Client ID", String.valueOf(clientId));

        ccHttp.startSession();

        String resultData = "Lotame Working from Mango Plugin";
        ret.put("message", implementation.echo(resultData));
        call.resolve(ret);
    }

    /**
     * Add Behavior Data.
     *
     * @param call
     * @throws JSONException
     * @throws IOException
     */
    @SuppressLint("LongLogTag")
    @PluginMethod
    public void addBehavior(PluginCall call) throws JSONException, IOException {
        JSObject dataBehavior = call.getObject("data");
        JSObject ret = new JSObject();

        String value = dataBehavior.getString("value");
        String forType = dataBehavior.getString("forType");

        if (value == null || forType == null) {
            // call.reject("Must provide a value and type of the behaviour");
            ret.put("message", implementation.echo("Must provide a value and type of the behaviour"));
            call.resolve(ret);
            return;
        }

        Log.d("Lotame addBehavior value", value);
        Log.d("Lotame addBehavior forType", forType);

        ccHttp.add(value, forType);

        if (ccHttp.isInitialized()) {
            Log.d("Lotame Behavior", "Lotame Behavior send data");
            ccHttp.bcp();

            ret.put("message", implementation.echo("Lotame Plugin added data"));
            ret.put("data", dataBehavior);
        } else {
            ret.put("message", implementation.echo("Lotame Plugin failure ccHttp is not initialized"));
        }

        call.resolve(ret);
    }

    public static void setTimeout(Runnable runnable, int delay){
        new Thread(() -> {
            try {
                Thread.sleep(delay);
                runnable.run();
            }
            catch (Exception e){
                System.err.println(e);
            }
        }).start();
    }
}
