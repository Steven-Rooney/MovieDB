
// Class to transfer data from database to GUI table
class RowTitle {
	public String title;
	public int year;
	public int length;
	public Double rating;

	RowTitle(String title, int year, int length, Double rating) {
		this.year = year;
		this.title = title;
		this.length = length;
		this.rating = rating;

	}
}