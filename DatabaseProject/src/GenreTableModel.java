import java.util.ArrayList;

import javax.swing.table.AbstractTableModel;

public class GenreTableModel extends AbstractTableModel {
	String[] columnNames = { "Genre", "Year", "Length", "Rating", "Title" };
	public ArrayList<genreRow> table = new ArrayList<genreRow>();

	public void setTable(ArrayList<genreRow> newTable) {
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
			return table.get(row).genre;
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
			return table.get(row).title;

		}

	}

	public boolean isCellEditable(int row, int col) {
		return false;
	}

	public void setValueAt(Object value, int row, int col) {
	}

}
