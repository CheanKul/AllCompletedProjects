//Login Window


import java.lang.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.util.*;
import java.io.*;

class Login extends Thread
{
	JFrame f;
	private Label Username,Password;
	private TextField usr;
	private JPasswordField psw;
	private Button submit,cancel;
	
	MarvellousFrame obj = new MarvellousFrame("Marvellous Login", 450, 350);
	
	int i = 3;
	
	public Login()
	{
		showBanner();		
		
		Username = new Label("Username");
		Username.setBounds(50,10,75,100);
		obj.fobj.add(Username);
		obj.fobj.setLayout(null);
		
		
		Password = new Label("Password");
		Password.setBounds(50,70,100,100);
		obj.fobj.add(Password);
		obj.fobj.setLayout(null);
		
		
		usr = new TextField();
		usr.setBounds(150,50,180,30);
		obj.fobj.add(usr);
		obj.fobj.setLayout(null);
		
		psw = new JPasswordField();
		psw.setBounds(150,100,180,30);
		obj.fobj.add(psw);
		obj.fobj.setLayout(null);
		
		submit = new Button("Submit");
		submit.setBounds(150,150,50,30);
		obj.fobj.add(submit);
		obj.fobj.setLayout(null);
		
		cancel = new Button("cancel");
		cancel.setBounds(250,150,50,30);
		obj.fobj.add(cancel);
		obj.fobj.setLayout(null);
		
		obj.Display(true);
		
		
		cancel.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				obj.fobj.dispose();
			}
	
		});
		
		submit.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				
				// String user = usr.getText();
				// String pass = psw.getPassword();
		
				// if(user.equals("") && pass.equals("admin"))
				// {
				// 	obj.fobj.dispose();
				// 	new PackerUnpacker();
				// }
				
				try
			{
				FileInputStream fin = new FileInputStream(".\\username.txt");
				BufferedReader br = new BufferedReader(new InputStreamReader(fin));
				String str = br.readLine();
				
				
				String[] info = str.split("\\s");
				String value1 = usr.getText();
				String value2 = new String(psw.getPassword());
				
					if((value1.equals(info[0]))&&(value2.equals(info[1])))
					{
						obj.fobj.dispose();
						new PackerUnpacker();
					}
					else
					{	
						i--;	
						if(i == 0)
						{
							JOptionPane.showMessageDialog(f,"Login Unsuccessful Please Try again Later..:(");
							obj.fobj.dispose();
						}
						Frame f = new Frame();
						String st = "You have "+ i +" attempt(s) left  ---"+info[0]+"---"+info[1]+"==="+value1+"==="+value2;
						JOptionPane.showMessageDialog(f,st);
					   	
						System.out.println(i);
						usr.setText("");
						psw.setText("");
						
					}
				
			}
			catch(Exception ex){}
			
			}
	
		});
		
	}


	public void showBanner()
	{
		int width = 690;
		int height = 290;
		f = new JFrame("Marvellous Infosystems");
		ImageIcon img = new ImageIcon(".\\Images\\images.png");
		JLabel ilabel = new JLabel(img);
		f.add(ilabel);
		f.setVisible(true);
		
		Dimension dim = Toolkit.getDefaultToolkit().getScreenSize();
		
		int p = (dim.width-width)/2;
		int q = (dim.height-height)/2;
		
		System.out.println(p);
		System.out.println(q);
		System.out.println(dim);
		
		f.setSize(width, height);
		f.setLocation(p,q);
		
		try
		{
			Thread.sleep(2000);
			f.dispose();
		}
		catch(Exception e)
		{}
		
	}
	
	
	public static void main(String arg[])
	{
		new Login();
	}
}