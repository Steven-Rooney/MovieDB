import java.util.ArrayList;

import javax.swing.table.AbstractTableModel;

public class directorTableModel extends AbstractTableModel {
	String[] columnNames = { "Title", "Year", "Length", "Rating", "Director Name" };
	public ArrayList<directorRow> table = new ArrayList<directorRow>();

	public void setTable(ArrayList<directorRow> newTable) {
		table = newTable;
	}

	public String getColumnName(int col) {
		return columnNames[col].toString();
	}

	public int getRowCount() {
		return table.size();
	}

	public int getColumnCount() {
		return columnNames.length;
	}

	public Object getValueAt(int row, int col) {

		if (col == 0) {
			return table.get(row).title;
		}
		if (col == 1) {
			return table.get(row).year;
		}
		if (col == 2) {
			return table.get(row).length;
		}
		if (col == 3) {
			return table.get(row).rating;
		} else {
			return table.get(row).directorName;

		}

	}

	public boolean isCellEditable(int row, int col) {
		return false;
	}

	public void setValueAt(Object value, int row, int col) {
	}

}
