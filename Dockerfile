FROM python:3.7

# Copy the required files into the image
RUN mkdir -p /opt/services/webapp/src
WORKDIR /opt/services/webapp/src
ADD project/. /opt/services/webapp/src
ADD requirements.txt /opt/services/webapp/requirements.txt

# Install Django and Gunicorn
RUN pip install --no-cache-dir -r /opt/services/webapp/requirements.txt

EXPOSE 8000

CMD ["gunicorn", "--chdir", "/opt/services/webapp/src", "--bind", ":8000", "project.wsgi:application"]


