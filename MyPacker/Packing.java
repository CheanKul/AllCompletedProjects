
//Packing
import java.lang.*;
import java.awt.*;
import java.awt.event.*;
import javax.swing.*;
import java.io.*;
import java.util.*;

class Packing extends Frame {
	Label dirname, target;
	TextField dir, dir2;
	Button pack, btnBrowse;

	MarvellousFrame obj = new MarvellousFrame("Marvellous Packing", 450, 350);
	String path, targetstr;

	public Packing() {
		dirname = new Label("Diectory Name");
		dirname.setBounds(50, 10, 85, 100);
		obj.fobj.add(dirname);
		obj.fobj.setLayout(null);

		target = new Label("Target File");
		target.setBounds(50, 70, 100, 100);
		obj.fobj.add(target);
		obj.fobj.setLayout(null);

		btnBrowse = new Button("Browse");
		btnBrowse.setBounds(350, 50, 80, 30);
		obj.fobj.add(btnBrowse);
		obj.fobj.setLayout(null);

		dir = new TextField();
		dir.setBounds(150, 50, 200, 30);
		obj.fobj.add(dir);
		obj.fobj.setLayout(null);

		dir2 = new TextField();
		dir2.setBounds(150, 100, 180, 30);
		obj.fobj.add(dir2);
		obj.fobj.setLayout(null);

		pack = new Button("Pack");
		pack.setBounds(200, 150, 70, 30);
		obj.fobj.add(pack);
		obj.fobj.setLayout(null);

		obj.Display(true);

		btnBrowse.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {

				JFileChooser fileChooser = new JFileChooser();
				fileChooser.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
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

		pack.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					File fobj = new File(path);
					ArrayList<FileData> li = new ArrayList<FileData>();
					if (fobj.isDirectory() == true) {
						String[] files = fobj.list();
						targetstr = dir2.getText();
						int i = 0;
						String txtFile="";

						for (String txtFile1 : files) {
							String insideFile = "";
							txtFile = path + "\\" + txtFile1;
							System.out.println(txtFile);
							FileReader fr = new FileReader(txtFile);

							while ((i = fr.read()) != -1) {
								System.out.print((char) i);
								insideFile += (char) i;
							}
							System.out.println();
							FileData fd = new FileData();
							fd.setName(txtFile1);
							fd.setData(insideFile);
							li.add(fd);

							fr.close();
						}
						ObjectOutputStream os = new ObjectOutputStream(
								new FileOutputStream(path + "\\" + targetstr, true));
						os.writeObject(li);
						os.close();

					}

					new PackerUnpacker();
				} catch (Exception ex) {
					ex.printStackTrace();
				}
			}
		});
	}

	public static void main(String arg[]) {
		Packing pobj = new Packing();
	}
}