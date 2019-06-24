
public class genreRow {
	public String title;
	public int year;
	public int length;
	public Double rating;
	public String genre;

	genreRow(String genre, int year, int length, Double rating, String title) {
		this.year = year;
		this.title = title;
		this.length = length;
		this.rating = rating;
		this.genre = genre;
	}
}
