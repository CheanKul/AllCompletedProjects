//Unpacking

import java.io.*;
import java.lang.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

class Unpacking extends Frame
{
	private Label fname,dirname;
	private TextField dir,dir2;
	private Button unpack,btnBrowse,btnBrow;

	MarvellousFrame obj = new MarvellousFrame("Marvellous Packing", 450, 350);
	String path, targetstr;
	public Unpacking()
	{
		fname = new Label("File Name");
		fname.setBounds(50,10,85,100);
		obj.fobj.add(fname);
		obj.fobj.setLayout(null);


		dir = new TextField();
		dir.setBounds(150,50,180,30);
		obj.fobj.add(dir);
		obj.fobj.setLayout(null);


		btnBrowse = new Button("Browse");
		btnBrowse.setBounds(350, 50, 80, 30);
		obj.fobj.add(btnBrowse);
		obj.fobj.setLayout(null);
		
		
		dirname = new Label("Directory Name");
		dirname.setBounds(50,70,100,100);
		obj.fobj.add(dirname);
		obj.fobj.setLayout(null);
	

		dir2 = new TextField();
		dir2.setBounds(150,100,180,30);
		obj.fobj.add(dir2);
		obj.fobj.setLayout(null);


		btnBrow = new Button("Browse");
		btnBrow.setBounds(350, 100, 80, 30);
		obj.fobj.add(btnBrow);
		obj.fobj.setLayout(null);
		

		unpack = new Button("Unpack");
		unpack.setBounds(200,150,70,30);
		obj.fobj.add(unpack);
		obj.fobj.setLayout(null);
		
		
		obj.Display(true);


		btnBrowse.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setAcceptAllFileFilterUsed(false);
				int rVal = fileChooser.showOpenDialog(null);
				if (rVal == JFileChooser.APPROVE_OPTION) {
					dir.setText(fileChooser.getSelectedFile().toString());
					File fobj = fileChooser.getSelectedFile();
					path = fobj.getAbsolutePath(); // get directory Absolute path in path variable
					dir.setText(path);
					System.out.println("Path :- " + path);
				}
			}
		});	

		btnBrow.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				fileChooser.setAcceptAllFileFilterUsed(false);
				int rVal = fileChooser.showOpenDialog(null);
				if (rVal == JFileChooser.APPROVE_OPTION) {
					dir2.setText(fileChooser.getSelectedFile().toString());
					File fobj = fileChooser.getSelectedFile();
					targetstr = fobj.getAbsolutePath(); // get directory Absolute path in path variable
					dir2.setText(targetstr);
					System.out.println("TargetStr :- " + targetstr);
				}
			}
		});	







		
		
		unpack.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try{
					FileInputStream is = new FileInputStream(path);
					ObjectInputStream ois = new ObjectInputStream(is);
					ArrayList<FileData> fd=new ArrayList<FileData>();
					fd=(ArrayList<FileData>)ois.readObject();
					
					ListIterator ite=fd.listIterator();
					while(ite.hasNext())
					{						
						FileData fi=(FileData)ite.next();
						System.out.println("obj :- "+fi.getName());
						System.out.println("obj :- "+fi.getData());

						File file=new File(targetstr + "\\" +fi.getName());
						FileOutputStream fos=new FileOutputStream(file);
						byte[] b=fi.getData().getBytes();
						fos.write(b);
						fos.close();					
					}




				}
				catch(Exception e2)
				{
					e2.printStackTrace();
				}
			}
		});
	}
	public static void main(String arg[])
	{
		Unpacking uobj = new Unpacking();
	}
}