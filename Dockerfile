# ใช้ Python 3.8 เป็นพื้นฐาน
FROM python:3.8-slim

# ตั้งค่า Working Directory
WORKDIR /app

# คัดลอกไฟล์ requirements.txt เพื่อติดตั้ง dependencies
COPY requirements.txt .

# ติดตั้ง dependencies
RUN pip install -r requirements.txt

# คัดลอกไฟล์โมเดลและโค้ดอื่น ๆ
COPY . .

# เปิดพอร์ต 7860 สำหรับ Gradio และพอร์ต 8000 สำหรับ Prometheus metrics
EXPOSE 7860
EXPOSE 8000

# รันแอป Gradio
CMD ["python", "app.py"]
