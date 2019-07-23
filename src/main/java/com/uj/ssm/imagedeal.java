package com.uj.ssm;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
public class imagedeal {
    public static BufferedImage img_cropper(String src,int x,int y,int width,int height) {
        String suffix = src.substring(src.lastIndexOf(".") + 1);
        BufferedImage bi=file2img(src);
        BufferedImage back=bi.getSubimage(x,y,width,height);
        img2file(back,suffix,src);
        return back;
    }
    private static BufferedImage file2img(String imgpath) {
        try {
            BufferedImage bufferedImage= ImageIO.read(new File(imgpath));
            return bufferedImage;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
    private static void img2file(BufferedImage img,String extent,String newfile) {
        try {
            ImageIO.write(img, extent, new File(newfile));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
