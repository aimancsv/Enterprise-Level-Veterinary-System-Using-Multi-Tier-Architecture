# Enterprise-Level-Veterinary-System-Using-Multi-Tier-Architecture
The Veterinary Clinic System is a scalable, web-based platform designed to streamline the operations of a Veterinary Clinic and Boarding facility that treats both domestic and exotic animals. The system uses web development technologies to leverage a multi-tier architecture to ensure modularization, maintainability, and efficient data management.


#### Key Features
1. **Multi-Tier Architecture**:
   - **Presentation Layer**: Built with JavaServer Pages (JSP) and JavaServer Faces (JSF) using PrimeFaces UI components to ensure a user-friendly interface.
   - **Business Layer**: Employs Enterprise Java Beans (EJB) for managing business logic and system processes.
   - **Database Tier**: Uses Java Persistence API (JPA) and JDBC for seamless database interaction and CRUD operations.

2. **User Roles and Functionalities**:
   - ![image](https://github.com/user-attachments/assets/2f6c9676-be60-4f98-9474-53f3fd7a2271) <br><br> <br><br>



     
   **A. Super Admin**: Manages staff accounts and oversees system operations. <br>
   
     <img width="600" alt="Screenshot 2024-12-31 at 9 18 46 AM" src="https://github.com/user-attachments/assets/7bcf566d-bc55-43ac-9d85-f8ef77654035" />   <br><br> <br><br>




   **B. Vets**: Registers accounts, makes diagnoses, views diagnosis history, and manages appointments. <br>
   
     <img width="600" alt="Screenshot 2024-12-31 at 9 19 45 AM" src="https://github.com/user-attachments/assets/58f9ab56-d2f0-4506-ab50-d7fc5b20ddcb" /> <br><br> 
     <img width="600" alt="Screenshot 2024-12-31 at 9 20 21 AM" src="https://github.com/user-attachments/assets/3f10259a-b52c-40d0-9c40-84d91b4f9354" /> <br><br> <br><br>





   **C. Receptionists**: Creates pet and customer profiles, schedules appointments, and assigns vet consultations.
   
     <img width="600" alt="Screenshot 2024-12-31 at 9 21 27 AM" src="https://github.com/user-attachments/assets/762a629c-aa2b-4df6-a6fc-9af2dc227621" /> <br><br>
     <img width="600" alt="Screenshot 2024-12-31 at 9 38 26 AM" src="https://github.com/user-attachments/assets/5fd2df8f-e572-48de-adf9-5a6c470f5e4c" /> <br><br> <br><br>






   **D. Managing Staff**: Oversees staff details, creates weekly work schedules, and accesses operational reports.
   
     <img width="600" alt="Screenshot 2024-12-31 at 9 22 04 AM" src="https://github.com/user-attachments/assets/9df77735-a73d-480e-8665-47282adab9ee" /> <br><br>
     <img width="600" alt="Screenshot 2024-12-31 at 9 39 07 AM" src="https://github.com/user-attachments/assets/8287dcbc-98a9-441d-8d56-3384f6c928a6" /> <br><br>
     <img width="500" alt="Screenshot 2024-12-31 at 9 22 23 AM" src="https://github.com/user-attachments/assets/58409cd0-0670-415f-b006-04902eda75ab" /> <br><br> <br><br>



4. **Database Design**:
   - A structured database stores and retrieves clinic data , including staff details, pet profiles, appointments, and work schedules.
   - Entity-Relationship Diagrams (ERD) and SQL scripts illustrate table relationships and ensure robust data organization.

5. **Web Development Technologies**:
   - JSP for dynamic web page rendering.
   - JSF with PrimeFaces for enhanced UI components like data tables, dialogs, and calendars.
   - JPA for mapping Java objects to database entities.
   - Servlets for linking frontend interactions to backend processes.

---

#### System Highlights
- **Modular and Scalable Design**: The multi-tier architecture supports easy maintenance, future upgrades, and scalability.
- **AbstractFacade Pattern**: Ensures uniform, reusable CRUD operations across entity classes.
- **Integration with Modern UI Tools**: Utilizes PrimeFaces and AJAX for responsive, dynamic web pages.
- **Comprehensive Reporting**: Enhances operational insights with detailed reports on clinic activities.

---

#### UML and Database Design
- **Use Case Diagrams**: Illustrate system interactions across roles like Vets, Receptionists, and Admins.
- **Class Diagrams**: Define the relationships and attributes of system entities.
- **Sequence Diagrams**: Highlight the flow of processes, such as scheduling appointments and managing profiles.
- **ERD**: Maps the relationships between database tables, ensuring data consistency and integrity.



