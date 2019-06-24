import java.awt.event.*;
import java.sql.SQLException;
import java.awt.*;
import javax.swing.*;

import java.io.*;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;

public class ButtonWindows extends JFrame {
	private JFrame f;
	JButton b, b1, b2, b3;
	JLabel l;
	JToolBar toolBar = new JToolBar();

	public void initWindow() throws IOException {

		f = new JFrame("panel");
		f.setLayout(new GridBagLayout());

		// create a label to display text
		l = new JLabel("panel label");

		// creates a button to open a window to search via Title
		b = new JButton("Search by Moive Title");
		b.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					// Need to update for different query
					titleGui window = new titleGui();

				} catch (ClassNotFoundException e1) {

					e1.printStackTrace();

				} catch (SQLException e1) {

					e1.printStackTrace();
				}
			}
		});

		// creates a button to open a window to search via Genre
		b1 = new JButton("Search by Moive Genre");
		b1.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					// need to update for different query
					genreGui window = new genreGui();

				} catch (ClassNotFoundException e1) {

					e1.printStackTrace();

				} catch (SQLException e1) {

					e1.printStackTrace();
				}
			}
		});
		// creates a button to open a window to search via Director
		b2 = new JButton("Search by Moive Director");
		b2.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					// need to update for different query
					directorGui window = new directorGui();

				} catch (ClassNotFoundException e1) {

					e1.printStackTrace();

				} catch (SQLException e1) {

					e1.printStackTrace();
				}
			}
		});
		
		b3 = new JButton("Search by Actor");
		b3.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					// need to update for different query
					actorGui window = new actorGui();

				} catch (ClassNotFoundException e1) {

					e1.printStackTrace();

				} catch (SQLException e1) {

					e1.printStackTrace();
				}
			}
		});

		// create a panel to add buttons and text field and a layout
		JPanel p = new JPanel();
		p.setSize(500, 400);

		f = new JFrame();
		f.setBounds(100, 100, 500, 400);
		f.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
		f.add(toolBar, BorderLayout.PAGE_END);
		toolBar.setFloatable( false);


		// Creating labels
		JTextArea area = new JTextArea("Welcome to BSU-Flix");
		JTextArea sArea = new JTextArea("We have a selection of Movie titles, movie genres, movie directors, and actors");
		JTextArea bArea = new JTextArea("Select an option below to start searchinng");

		area.setBounds(70, 0, 490, 40);
		area.setFont(new Font("Arial", 1, 40));
		area.setEditable(false);
		area.setBorder(null);
		area.setBackground(f.getBackground());

		sArea.setBounds(70, 60, 450, 100);
		sArea.setFont(new Font("Arial", 1, 25));
		sArea.setWrapStyleWord(true);
		sArea.setLineWrap(true);
		sArea.setEditable(false);
		sArea.setBorder(null);
		sArea.setBackground(f.getBackground());

		bArea.setBounds(70, 275, 400, 25);
		bArea.setFont(new Font("Arial", 1, 20));
		bArea.setWrapStyleWord(true);
		bArea.setLineWrap(true);
		bArea.setEditable(false);
		bArea.setBorder(null);
		bArea.setBackground(f.getBackground());

		// adding logo

		BufferedImage myPicture = ImageIO.read(new File("bin\\BsuFlix.png"));
		JLabel picLabel = new JLabel(new ImageIcon(myPicture));
		picLabel.setBounds(50, 160, 450, 100);

		f.add(picLabel);

		f.add(area);
		f.add(sArea);
		f.add(bArea);

		// add buttons and textfield to panel

		toolBar.add(b);
		toolBar.add(b1);
		toolBar.add(b2);
		toolBar.add(b3);

		// add panel to frame
		f.add(p);

		// set the size of frame
		f.setSize(560, 400);

	}

	public static void main(String[] args) throws IOException {
		ButtonWindows window = new ButtonWindows();
		window.initWindow();
		window.f.setVisible(true);
	}
}
