<?php
    function verifica_image($img)
    {
        // Verifica se o mime-type do arquivo é de imagem
        if(eregi("^image\/(pjpeg|jpeg|png|gif|bmp)$", $img["type"]))
        {
            return (TRUE);
        }
        return (FALSE);
    }// fim verifica_image
    
    function verifica_extensao_image($img)
    {
        // Pega extensão do arquivo
        preg_match("/\.(gif|bmp|png|jpg|jpeg){1}$/i", $img["name"], $ext);
        return ($ext[1]);
    }//fim verifica_extensao_imag
    
    function verifica_dimensao_image($img, $max_x, $max_y)
    {
        $dimensaoImage = getimagesize($img["tmp_name"]);
        $dimensao = '';
        // Verifica largura
        if($dimensaoImage[0] > $dimensaoImage[1])
        {
            if($dimensaoImage[0] > $max_x)
            {
                $dimensao = 'largura';
            }
        }
        else
        {
            if($dimensaoImage[0] < $dimensaoImage[1])
            {
                if($dimensaoImage[1] > $max_x)
                {
                    $dimensao = 'altura';
                }
            }
            else
            {
                if($dimensaoImage[0] == $dimensaoImage[1])
                {
                    if($dimensaoImage[0] > $max_x)
                    {
                        $dimensao = 'largura';
                    }
                }
            }
        }
        return ($dimensao);        
    }//fim verifica_dimensao_image
    
    function reduz_imagem($img, $max_x, $max_y, $nome_foto) 
    {
        //pega o tamanho da imagem ($original_x, $original_y)
        list($width, $height) = getimagesize($img);
        $original_x = $width;
        $original_y = $height;
        // se a largura for maior que altura
        if($original_x > $original_y) {
               $porcentagem = (100 * $max_x) / $original_x;      
        } 
        else {
               $porcentagem = (100 * $max_y) / $original_y;
        }
        $tamanho_x = $original_x * ($porcentagem / 100);
        $tamanho_y = $original_y * ($porcentagem / 100);
        $image_p = imagecreatetruecolor($tamanho_x, $tamanho_y);
        $image   = imagecreatefromjpeg($img);
        imagecopyresampled($image_p, $image, 0, 0, 0, 0, $tamanho_x, $tamanho_y, $width, $height);
        return imagejpeg($image_p, $nome_foto, 100);
    }//fim reduz_imagem
?>
