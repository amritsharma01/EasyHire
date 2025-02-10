# EasyHire

EasyHire is an **online job portal** that connects job seekers and employers. Built with **Django REST Framework** for the backend and **Flutter** for the frontend, it provides a seamless experience for job applications, postings, and user authentication.

## Features

### Authentication
- Custom **JWT authentication** system (login, register, logout)
- **Secure token storage** (Hive in Flutter)
- **User roles**: Job Seeker & Employer

### Job Seeker Features
- Create and manage **profile**
- Browse and search for **jobs**
- Apply for jobs **with cover letters**
- View application status(in progress)

### Employer Features
- **Post jobs** with detailed descriptions
- **Manage job listings** (edit, delete)
- View and manage **applications**

### Additional Features
- **salary-based filtering** for job searches
- **Pagination** for job listings
- **User-friendly UI** with Riverpod state management

## Tech Stack

### Backend (Django & DRF)
- **Django** – Framework
- **Django REST Framework** – API development
- **JWT authentication** – Secure token-based login

### Frontend (Flutter)
- **Flutter** – UI framework
- **Riverpod** – State management
- **Dio** – API requests
- **Hive** – Local storage

## Project Structure

### Backend (Django)
```
easyhire-server/
│── users/          # Custom user model & authentication
│── job/          # Job-related endpoints (CRUD)
│── jobportal/  # Job application handling
```

### Frontend (Flutter)
```
easyhire-app/
│── lib/
│   ├── abstractservices/          # Data layer (models, repositories)
│   ├── core/        # Business logic (use cases, entities)
│   ├── features/  # data, domain, presentatino
```

## Installation & Setup

### Backend
```sh
# Clone the repository
git clone https://github.com/amritsharma01/easyhire.git
cd easyhire/easyhire-server

# Create virtual environment
python -m venv venv
source venv/bin/activate  # (Linux/macOS)
venv\Scripts\activate  # (Windows)

# Install dependencies
pip install -r requirements.txt

# Apply migrations
python manage.py migrate

# Run server
python manage.py runserver
```

### Frontend
```sh
cd easyhire/easyhire-app

# Install Flutter dependencies
flutter pub get

# Run the app
flutter run
```

## API Endpoints

### Authentication
- `POST /api/auth/register/` – Register new users
- `POST /api/auth/login/` – Login & get JWT tokens
- `POST /api/auth/refresh/` – get new access token
- `GET /api/auth/profile/` – Retrieve user profile

### Jobs
- `GET /api/jobs/list` – List all jobs
- `POST /api/jobs/post` – Create a new job (Employer only)
- `GET /api/jobs/{id}/` – Get job details
- `PUT /api/jobs/{id}/` – Update job (Employer only)
- `DELETE /api/jobs/{id}/` – Delete job (Employer only)

### Applications
- `POST /api/apply/` – Apply for a job
- `GET /api/applications/` – View job applications (Employer only)

## Future Enhancements
- **Real-time notifications** (WebSockets/Firebase)
- **Resume parsing & matching**
- **Interview scheduling** system
- **Admin panel** for job moderation


## Contributors
- **Amrit Sharma** - [amritsharma1027@gmail.com](mailto:amritsharma1027@gmail.com)

## Contact
For questions or feedback, reach out via email).
