package Operator;

public class Essay
{
    private int number = 0;
    private String series = "default";
    private String title = "title";
    private String text = "text";
    
    public Essay(int number, String title)
    {
        this.number = number;
        this.title = title;
    }
    
    public Essay(int number, String series, String title, String text) 
    {
        this.number = number;
        this.series = series;
        this.title = title;
        this.text = text;
    }

    public int getNumber()
    {
        return number;
    }

    public void setNumber(int number)
    {
        this.number = number;
    }
    
    public String getSeries()
    {
        return series;
    }

    public void setSeries(String series)
    {
        this.series = series;
    }

    public String getTitle()
    {
        return title;
    }

    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getText()
    {
        return text;
    }

    public void setText(String text)
    {
        this.text = text;
    }
}
