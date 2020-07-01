{-# LANGUAGE OverloadedStrings #-}

module Main where

import Control.Lens (to, only, toListOf, folded)
import Data.Text.Encoding.Error (lenientDecode)
import Data.Text.Lazy.Encoding (decodeUtf8With)
import Network.Wreq (responseBody, get)
import Text.Taggy.Lens (html, children, allAttributed)

main = (toListOf $ responseBody . to (decodeUtf8With lenientDecode) . html . allAttributed (folded . only "recentcomments") . children) <$> (get "https://fakenous.net") >>= print 
