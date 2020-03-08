import java.sql.*;
import java.util.Scanner;
import oracle.jdbc.driver.OracleDriver;

public class Reporting {
    private static Connection conn;

    public static void main(String[] args) {
        if(args.length < 3) {
            System.out.println("1- Report Patients Basic Information\n" +
                    "2- Report Doctors Basic Information\n" +
                    "3- Report Admissions Information\n" +
                    "4- Update Admissions Payment");
            return;
        }
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (ClassNotFoundException e) {
           e.printStackTrace();
        }

        try {
            conn = createConnect(args[0], args[1]);
            switch (args[2]) {
                case "1":
                    option1();
                    break;
                case "2":
                    option2();
                    break;
                case "3":
                    option3();
                    break;
                case "4":
                    option4();
                    break;
                default:
                    System.out.println("1- Report Patients Basic Information\n" +
                            "2- Report Doctors Basic Information\n" +
                            "3- Report Admissions Information\n" +
                            "4- Update Admissions Payment");
                    return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }

    private static Connection createConnect(String username, String password) throws SQLException {
        return DriverManager.getConnection("jdbc:oracle:thin:@csorcl.cs.wpi.edu:1521:orcl", username, password);
    }

    private static void closeEverything(Statement s, ResultSet rs, Scanner sc) throws SQLException {
        if(sc != null) {
            sc.close();
        }
        if(rs != null) {
            rs.close();
        }
        if(s != null) {
            s.close();
        }
        if(conn != null) {
            conn.close();
        }
    }

    private static void option1() throws SQLException {
        System.out.print("Enter Patient SSN: ");
        Scanner scanner = new Scanner(System.in);
        String ssn = scanner.nextLine();
        System.out.println();

        PreparedStatement ps = conn.prepareStatement("select SSN, fName, lName, address from Patient where SSN=?");
        ps.setString(1, ssn);
        ResultSet rs = ps.executeQuery();

        String fName = "";
        String lName = "";
        String address = "";
        while(rs.next()) {
            ssn = rs.getString("SSN");
            fName = rs.getString("fName");
            lName = rs.getString("lName");
            address = rs.getString("address");
        }
        System.out.println("Patient SSN: " + ssn + "\n" +
                "Patient First Name: " + fName + "\n" +
                "Patient Last Name: " + lName + "\n" +
                "Patient Address: " + address);
        closeEverything(ps, rs, scanner);
    }

    private static void option2() throws SQLException {
        System.out.print("Enter Doctor ID: ");
        Scanner scanner = new Scanner(System.in);
        String did = scanner.nextLine();
        System.out.println();

        PreparedStatement ps = conn.prepareStatement("select ID, fName, lName, gender from Doctor where ID=?");
        ps.setString(1, did);
        ResultSet rs = ps.executeQuery();

        String fName = "";
        String lName = "";
        String gender = "";
        while(rs.next()) {
            did = rs.getString("ID");
            fName = rs.getString("fName");
            lName = rs.getString("lName");
            gender = rs.getString("gender");
        }
        System.out.println("Doctor ID: " + did + "\n" +
                "Doctor First Name: " + fName + "\n" +
                "Doctor Last Name: " + lName + "\n" +
                "Doctor Gender: " + gender);
        closeEverything(ps, rs, scanner);
    }

    private static void option3() throws SQLException {
        System.out.print("Enter Admission Number: ");
        Scanner sc = new Scanner(System.in);
        String num = sc.nextLine();
        System.out.println();

        PreparedStatement ps = conn.prepareStatement("select num, patientSSN, admissionDate, totalPayment, roomNum, startDate, endDate, doctorID " +
                "from Admission A, Examine E, StayIn S where num=? and num=E.admissionNum and E.admissionNum=S.admissionNum");
        ps.setString(1, num);

        String ssn = "";
        Date admDate = null;
        String payment = "";
        String roomNum = "";
        Date from = null;
        String to = "";
        String dr = "";

        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
            num = rs.getString("num");
            ssn = rs.getString("patientSSN");
            admDate = rs.getDate("admissionDate");
            payment = rs.getString("totalPayment");
            roomNum = rs.getString("roomNum");
            from = rs.getDate("startDate");
            to = rs.getString("endDate");
            dr = rs.getString("doctorID");
        }

        System.out.println("Admission Number: " + num + "\n" +
                "Patient SSN: " + ssn + "\n" +
                "Admission date (start date): " + admDate.toString() + "\n" +
                "Total Payment: " + payment + "\n" +
                "Rooms:\n" +
                "RoomNum: " + roomNum + " FromDate: " + from.toString() + " ToDate: " + to + "\n" +
                "Doctors examined the patient in this admission:\n" +
                "Doctor ID: " + dr);
        closeEverything(ps, rs, sc);
    }

    private static void option4() throws SQLException {
        System.out.print("Enter Admission Number: ");
        Scanner sc = new Scanner(System.in);
        String admissionNum = sc.nextLine();
        System.out.println();
        System.out.print("Enter the new total payment: ");
        String newPayment = sc.nextLine();
        System.out.println();

        PreparedStatement ps = conn.prepareStatement("update Admission set totalPayment=? where num=?");
        ps.setString(1, newPayment);
        ps.setString(2, admissionNum);
        ps.executeUpdate();
        closeEverything(ps, null, sc);
    }
}
