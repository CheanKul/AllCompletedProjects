
import java.lang.*;
import java.awt.*;
import java.awt.event.WindowEvent;  
import java.awt.event.WindowListener;
import java.awt.event.WindowAdapter;
import javax.swing.*; 

public class MarvellousFrame extends JFrame
{
	public String str;
	public int width;
	public int height;
	public Frame fobj;
	public Image img;
	
	public MarvellousFrame(String str1,int x,int y)
	{
		str = str1;
		width = x;
		height = y;
		
		fobj = new Frame(str);
		
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();

		int p = (dim.width-width)/2;
		int q = (dim.height-height)/2;

		fobj.setSize(width, height);
		fobj.setLocation(p,q);

		
		img = Toolkit.getDefaultToolkit().createImage(".\\Images\\images.png");
		
		fobj.addWindowListener(new WindowAdapter()
		{
			public void windowClosing(WindowEvent e)
			{
				System.exit(0);
			}
		});
		
	}
	
	public void paint(Graphics g)
    {
        g.drawImage(img, 0, 0, null);
    }
	  
	
	public void Display(Boolean value)
	{
		fobj.setVisible(true);
	}
}


