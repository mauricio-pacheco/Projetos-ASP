<?php

// Loads the required language file for module (from Patrick Kellum <webmaster@ctarl-ctarl.com>)
// ===========================================
   function modules_get_language($script = 'global')
   {
      global $ModName, $currentlang, $language;
      if (file_exists("modules/$ModName/lang/$currentlang/$script.php"))
      {
         @include "modules/$ModName/lang/$currentlang/$script.php";
      }
      elseif (!empty($language))
      {
         if (file_exists("modules/$ModName/lang/$language/$script.php"))
         {
            @include "modules/$ModName/lang/$language/$script.php";
         }
      }
      else
      {
         @include "modules/$ModName/lang/eng/$script.php";
      }
      return ;
   }

?>
