	import java.util.ArrayList;

	import javax.swing.table.AbstractTableModel;

	public class actorTableModel extends AbstractTableModel {
		String[] columnNames = { "Name", "Title", "Length", "Rating", "Year"};
		public ArrayList<actorRow> table = new ArrayList<actorRow>();

		public void setTable(ArrayList<actorRow> newTable) {
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
				return table.get(row).name;
			}
			if (col == 1) {
				return table.get(row).title;
			}
			if (col == 2) {
				return table.get(row).length;
			}
			if (col == 3) {
				return table.get(row).rating;
			} 
			else {
				return table.get(row).year;

				

			}

		}

		public boolean isCellEditable(int row, int col) {
			return false;
		}

		public void setValueAt(Object value, int row, int col) {
		}

	}
