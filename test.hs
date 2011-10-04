 {-# LANGUAGE OverloadedStrings #-}
 import Web.GooglePlus
 import Web.GooglePlus.Monad
 import Web.GooglePlus.Types
 import Control.Monad.Reader
 import Data.Text (pack, unpack)
 

 doStuff :: GooglePlusM String
 doStuff = do
   p <- getPerson $ PersonID $ pack "userId"
   t <- case p of Right person -> do
                    return $ show person
                  Left t -> do
                    return $ unpack t
   return t
 
 main :: IO ()
 main = do
   str <- runReaderT (unGooglePlusM doStuff) env
   print str
   return ()
   where env  = GooglePlusEnv { gpAuth = APIKey "APIKey" }

