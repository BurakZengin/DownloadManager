/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.downloadmanager.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.ByteBuffer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.java_websocket.client.WebSocketClient;
import org.java_websocket.handshake.ServerHandshake;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author burakzengin
 */
@Controller
public class MainController {

    @RequestMapping(value = "/")
    public String Login() {
        return "home";
    }

    @RequestMapping(value = "/Transfer", method = RequestMethod.POST)
    public String SocketHandler(HttpServletResponse response) throws URISyntaxException {

        File file = new File(System.getProperty("user.home"), "sample.mp3");
        WebSocketClient mWs = new WebSocketClient(new URI("wss://downloadmanagerserver1.herokuapp.com/downloadManager1/123131")) {
            @Override
            public void onMessage(ByteBuffer bb) {

                System.out.println("Path " + file.getAbsolutePath());
                FileOutputStream fos = null;
                try {
                    fos = new FileOutputStream(file);
                    fos.write(bb.array());
                    fos.flush();
                    fos.close();
                } catch (FileNotFoundException ex) {
                    Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
                } catch (IOException ex) {
                    Logger.getLogger(MainController.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            @Override
            public void onOpen(ServerHandshake handshake) {
                System.out.println("opened connection");
            }

            @Override
            public void onClose(int code, String reason, boolean remote) {
                System.out.println("closed connection");
            }

            @Override
            public void onError(Exception ex) {
            }

            @Override
            public void onMessage(String string) {
                throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
            }
        };
        //open websocket
        mWs.connect();

        try {
            InputStream inputStream = new FileInputStream(file);
            response.setContentType("application/force-download");
            response.setHeader("Content-Disposition", "attachment; filename=sample.mp3");
            IOUtils.copy(inputStream, response.getOutputStream());
            response.flushBuffer();
            inputStream.close();
        } catch (Exception e) {
            //LOGGER.debug("Request could not be completed at this moment. Please try again.");
            e.printStackTrace();
        }
////        JSONObject obj = new JSONObject();
////        obj.put("event", "addChannel");
////        obj.put("channel", "ok_btccny_ticker");
////        String message = obj.toString();
////        //send message
////        mWs.send(message);
        return "home";
    }
}
