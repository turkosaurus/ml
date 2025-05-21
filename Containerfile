# Use the official Python 3 image as the base
FROM python:3

# Install Jupyter
RUN pip install jupyter

# Set the default command to start Jupyter Console
CMD ["jupyter", "console"]
