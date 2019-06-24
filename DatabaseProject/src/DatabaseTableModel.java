import java.util.ArrayList;

import javax.swing.table.AbstractTableModel;

/**
 * 
 * The GUI table requires a model to define what data appears at each row/column
 */
public class DatabaseTableModel extends AbstractTableModel {
	String[] columnNames = { "Title", "Year", "Length", "Rating", "Genre" };
	public ArrayList<RowTitle> table = new ArrayList<RowTitle>();

	public void setTable(ArrayList<RowTitle> newTable) {
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
		} else {
			return table.get(row).rating;
		}

	}

	public boolean isCellEditable(int row, int col) {
		return false;
	}

	public void setValueAt(Object value, int row, int col) {
	}

}
