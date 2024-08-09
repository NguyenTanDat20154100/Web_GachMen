package bean;

import java.io.Serializable;

public class User implements Serializable {
    private String idUser;
    private String userName;
    private String email;
    private String passWord;
    private int isAdmin;
    private String name;
    private String phone;

    private int status;
    private String day_register;


    private Role role;

    public User() {
    }

    public User(String idUser, String userName, String email, String passWord, int isAdmin, String name, String phone, int status, String day_register) {
        this.idUser = idUser;
        this.userName = userName;
        this.email = email;
        this.passWord = passWord;
        this.isAdmin = isAdmin;
        this.name = name;
        this.phone = phone;
        this.status = status;
        this.day_register = day_register;
    }

    @Override
    public String toString() {
        return "User{" +
                "idUser='" + idUser + '\'' +
                ", userName='" + userName + '\'' +
                ", email='" + email + '\'' +
                ", passWord='" + passWord + '\'' +
                ", isAdmin=" + isAdmin +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", status=" + status +
                ", day_register='" + day_register + '\'' +
                ", role=" + role +
                '}';
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }



    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDay_register() {
        return day_register;
    }

    public void setDay_register(String day_register) {
        this.day_register = day_register;
    }

    public boolean accept(String name) {
        return role.accept(name);
    }

    public Role getRole() {
        return role;
    }
    public void setRole(Role role) {
        this.role = role;
    }
}
