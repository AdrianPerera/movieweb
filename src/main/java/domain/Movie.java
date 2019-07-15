package domain;


import java.util.ArrayList;

public class Movie{

    private String _id;
    private String name;
    private int year;
    private String genere;
    private ArrayList<String> actorsnames;
    private String description;
    private String imgurl;

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getGenere() {
        return genere;
    }

    public void setGenere(String genere) {
        this.genere = genere;
    }

    public ArrayList<String> getActorsnames() {
        return actorsnames;
    }

    public void setActorsnames(ArrayList<String> actorsnames) {
        this.actorsnames = actorsnames;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "_id='" + _id + '\'' +
                ", name='" + name + '\'' +
                ", year=" + year +
                ", genere='" + genere + '\'' +
                ", actorsnames=" + actorsnames +
                ", description='" + description + '\'' +
                ", imgurl='" + imgurl + '\'' +
                '}';
    }
}


