import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.sql.Connection;

import javax.swing.JFrame;
import javax.swing.JTextField;
import javax.swing.event.TableModelEvent;
import javax.swing.event.TableModelListener;

import java.awt.BorderLayout;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.swing.JTable;
import javax.swing.JScrollPane;

//new imports
import javax.swing.*;
import javax.swing.JButton;
import java.awt.event.*;

public class titleGui implements KeyListener, TableModelListener {
	// Database connectivity
	Connection connection;
	String sql;
	String DB_PATH = titleGui.class.getResource("MoiveDB.db").getFile();

	// GUI objects
	private JFrame frame;
	private JTable table;
	private JTextField textField;
	private JScrollPane scrollPane;

	// Connect database with table
	DatabaseTableModel tableModel = new DatabaseTableModel();

	/**
	 * Create the application.
	 * 
	 * @throws SQLException
	 * @throws ClassNotFoundException
	 */
	public titleGui() throws ClassNotFoundException, SQLException {
		// load the sqlite-JDBC driver using the current class loader
		Class.forName("org.sqlite.JDBC");

		// protocol (jdbc): subprotocol (sqlite):databaseName
		// (Chinook_Sqlite_AutoIncrementPKs.sqlite)
		connection = DriverManager.getConnection("jdbc:sqlite:" + DB_PATH);

		// Initialize GUI
		initializeGUI();

		// Initialize event handlers
		initializeListeners();
	}

	/**
	 * Initialize the contents of the frame.
	 * 
	 * @throws ClassNotFoundException
	 * @throws SQLException
	 */

	public void initializeGUI() throws ClassNotFoundException, SQLException {

		// Setup the main window
		frame = new JFrame();
		frame.setBounds(350, 0, 750, 500);
		frame.setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

		// Place the search box at the top
		textField = new JTextField();
		textField.setToolTipText("Search by Movie Title");
		frame.getContentPane().add(textField, BorderLayout.NORTH);
		textField.setColumns(10);

		// Place the table in a scroll pane in the center
		table = new JTable(tableModel);
		scrollPane = new JScrollPane(table);
		frame.getContentPane().add(scrollPane, BorderLayout.CENTER);
		frame.setVisible(true);

	}

	// Listeners (event handlers) define what to do in response to events.
	// GUIs use on event handlers to bind user actions with computation.
	private void initializeListeners() {

		// When the user types something, tell the table to update itself
		textField.addKeyListener(this);

		// Define what to do when the table needs to be updated
		// That is, run queries on user input
		// Registering event handler to DatabaseTableModel
		// addTableModelListener need TableModelListener as an argument - used as an
		// Innerclass
		tableModel.addTableModelListener(this);

		// Load the table on startup
		tableModel.fireTableDataChanged();
	}

	@Override
	public void keyTyped(KeyEvent e) {
	}

	@Override
	public void keyPressed(KeyEvent e) {
	}

	@Override
	public void keyReleased(KeyEvent e) {
		// fireTableDataChanged() is a method in AbstractTableModel
		// This method calls tableChanged method
		// This is defined in swing
		// We implement database query to update the table in the tableChanged() method
		tableModel.fireTableDataChanged();
	}

	// Whenever the key is released, call this method
	@Override
	public void tableChanged(TableModelEvent e) {
		String param = textField.getText();
		// generate parameterized sql
		if (param.equalsIgnoreCase("")) {
			sql = "select Title, year, length, rating " + "from Movies ";

		} else {
			sql = "select Title, year, length, rating " + "from Movies " + "where Title like ?";
		}

		// System.out.println("\nSQL: " + sql + "\n");

		try {

			PreparedStatement stmt = connection.prepareStatement(sql);

			if (!param.equalsIgnoreCase("")) {
				stmt.setString(1, "%" + param + "%");
			}

			// get results
			ResultSet res = stmt.executeQuery();

			// Transfer data from database to GUI
			ArrayList<RowTitle> table = new ArrayList<RowTitle>();
			while (res.next()) {
				table.add(new RowTitle(res.getString("Title"), res.getInt("Year"), res.getInt("Length"),
						res.getDouble("Rating")));
			}
			tableModel.setTable(table);

		} catch (Exception e1) {
			e1.printStackTrace();
		}

	}

}
