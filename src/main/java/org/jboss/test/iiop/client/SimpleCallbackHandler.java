package org.jboss.test.iiop.client;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.NameCallback;
import javax.security.auth.callback.PasswordCallback;
import javax.security.auth.callback.UnsupportedCallbackException;

class SimpleCallbackHandler implements CallbackHandler
   {
      String username;
      char[] password;

      public SimpleCallbackHandler(String username, String password)
      {
         this.username = username;
         this.password = password.toCharArray();
      }

      public void handle(Callback[] callbacks) throws IOException, UnsupportedCallbackException
      {
         for (Callback callback : callbacks)
         {
            if (callback instanceof NameCallback)
            {
               NameCallback nameCallback = (NameCallback) callback;
               nameCallback.setName(this.username);
            }
            else if (callback instanceof PasswordCallback)
            {
               PasswordCallback passCallback = (PasswordCallback) callback;
               passCallback.setPassword(this.password);
            }
            else
               throw new UnsupportedCallbackException(callback);
         }
      }
   }