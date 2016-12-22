/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package General;

/**
 *
 * @author Home
 */
import com.lowagie.text.Document;
import com.lowagie.text.Image;
import com.lowagie.text.PageSize;
import com.lowagie.text.pdf.Barcode128;
import com.lowagie.text.pdf.BarcodeEAN;
import com.lowagie.text.pdf.BarcodePDF417;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfWriter;
import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.imageio.ImageIO;
import org.apache.commons.io.FileUtils;

public class BarCode {
public static void generate(String data,String path) throws FileNotFoundException, IOException {
 
   path=path+File.separator+data+File.separator;
      
      File dir=new File(path);
        if(dir.exists())
            FileUtils.deleteDirectory(dir);
        
        
        dir.mkdir();
     path += data+".png";
  
  
  BarcodePDF417 barcode = new BarcodePDF417();
    barcode.setText(data);
    java.awt.Image img = barcode.createAwtImage(Color.BLACK, Color.WHITE);
    BufferedImage outImage = new BufferedImage(img.getWidth(null), img.getHeight(null), BufferedImage.TYPE_INT_RGB);
    outImage.getGraphics().drawImage(img, 0, 0, null);
    ByteArrayOutputStream bytesOut = new ByteArrayOutputStream();
    ImageIO.write(outImage, "png", bytesOut);
    bytesOut.flush();
    byte[] pngImageData = bytesOut.toByteArray();
    FileOutputStream fos = new FileOutputStream(path);
    fos.write( pngImageData);
    fos.flush();
    fos.close();
 
 }
 
 
}