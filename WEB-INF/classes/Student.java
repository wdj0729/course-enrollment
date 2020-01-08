package studentUpdateBean;

public class Student {
    private String s_id;
    private String s_name;
    private String s_addr;
    private int s_year;
    private String s_college;
    private String s_major;
    private String s_pwd;
    private String s_phonenumber;

    public Student()
    {
        s_id = null;
        s_name = null;
        s_addr = null;
        s_year = 0;
        s_college = null;
        s_major = null;
        s_pwd = null;
        s_phonenumber= null;
    }

    public String getS_id() {
        return s_id;
    }

    public void setS_id(String s_id) {
        this.s_id = s_id;
    }

    public String getS_name() {
        return s_name;
    }

    public void setS_name(String s_name) {
        this.s_name = s_name;
    }

    public String getS_addr() {
        return s_addr;
    }

    public void setS_addr(String s_addr) {
        this.s_addr = s_addr;
    }

    public int getS_year() {
        return s_year;
    }

    public void setS_year(int s_year) {
        this.s_year = s_year;
    }

    public String getS_college() {
        return s_college;
    }

    public void setS_college(String s_college) {
        this.s_college = s_college;
    }

    public String getS_major() {
        return s_major;
    }

    public void setS_major(String s_major) {
        this.s_major = s_major;
    }

    public String getS_pwd() {
        return s_pwd;
    }

    public void setS_pwd(String s_pwd) {
        this.s_pwd = s_pwd;
    }

    public String getS_phonenumber(){
	return s_phonenumber;
    }

    public void setS_phonenumber(String s_phonenumber){
	this.s_phonenumber= s_phonenumber;
    }
}