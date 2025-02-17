#Uses python image as a base, to use python & pip
FROM python

#Sets work directory
WORKDIR '/app'

#Installs project dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

#Copies project files - unnecessary due to voluming
#but kept for easy migration to different deployment
COPY ./ ./

#Commands to run the server
CMD sh -c "python manage.py makemigrations && \
                    python manage.py migrate && \
                    python manage.py runserver 0.0.0.0:8000"
