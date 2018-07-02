//PackerUnpacker Window


import java.lang.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class PackerUnpacker extends Frame
{
	private Button pack,unpack;
	private Label title;
	
	MarvellousFrame obj = new MarvellousFrame("Marvellous PackerUnpacker", 450, 350);
	
	public PackerUnpacker()
	{
		title = new Label("Packing & Unpacking");
		title.setBounds(160,30,130,100);
		obj.fobj.add(title);
		obj.fobj.setLayout(null);
		
		pack = new Button("Pack");
		pack.setBounds(100,180,80,30);
		obj.fobj.add(pack);
		obj.fobj.setLayout(null);
		
		unpack = new Button("Unpack");
		unpack.setBounds(300,180,80,30);
		obj.fobj.add(unpack);
		obj.fobj.setLayout(null);
		
		obj.Display(true);
	

		pack.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				obj.fobj.dispose();
				new Packing();
			}
	
		});
		
		
		unpack.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				obj.fobj.dispose();
				new Unpacking();
			}
	
		});
		
	}
	
	
	
	
	public static void main(String arg[])
	{
		PackerUnpacker pobj = new PackerUnpacker();
			
	}
}