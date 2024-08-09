package bean;

import java.util.ArrayList;

public class Role {
    ArrayList<String> accept;

    public Role(ArrayList<String> accept) {
        this.accept = accept;
    }

    public ArrayList<String> getAccept() {
        return accept;
    }

    public void setAccept(ArrayList<String> accept) {
        this.accept = accept;
    }
    public boolean accept(String name){
        return accept!=null&&accept.contains(name);
    }
}
