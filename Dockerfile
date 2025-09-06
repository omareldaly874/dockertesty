# استخدم صورة Node.js الرسمية
FROM node:18

# تثبيت pm2 بشكل عالمي
RUN npm install -g pm2

# تحديد مجلد العمل داخل الكونتينر
WORKDIR /app

# نسخ ملفات المشروع من GitHub
RUN git clone https://github.com/omareldaly874/http.git . 

# تثبيت الـ dependencies
RUN npm install

# حفظ الـ process ecosystem (لو محتاج)
# لكن غالباً pm2-runtime كافي
# RUN pm2 save

# تشغيل التطبيق باستخدام pm2-runtime
CMD ["pm2-runtime", "server.js", "--name", "http-server"]

# إتاحة البورت (حسب مشروعك)
EXPOSE 8000
