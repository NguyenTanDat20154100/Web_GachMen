package bean;

public class Reviews {

    private String userName;
    private String content;
    private String postDate;

    public Reviews (String userName, String content, String postDate) {
        this.userName = userName;
        this.content = content;
        this.postDate = postDate;
    }
    public Reviews( String userName, String content) {
        this.userName = userName;
        this.content = content;
    }

    public Reviews() {

    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    @Override
    public String toString() {
        return "Reviews{" +
                ", userName='" + userName + '\'' +
                ", content='" + content + '\'' +
                ", postDate='" + postDate + '\'' +
                '}';
    }
}
