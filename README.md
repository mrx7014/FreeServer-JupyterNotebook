# FreeServer-JupyterNotebook

بيئة Jupyter جاهزة للعمل مع **Almond Scala kernel**، وتحتوي على أدوات النظام الأساسية للتطوير، Git، Graphviz، وبناء المشاريع. الصورة مبنية فوق `almondsh/almond:latest`، لذلك تكون Kernels الخاصة بـ Scala مثبتة مسبقًا.

## ما الذي توفره الصورة؟

- JupyterLab وJupyter Notebook.
- Almond kernels الخاصة بـ Scala.
- Java التي يحتاجها Almond.
- أدوات التطوير: `git`, `git-lfs`, `build-essential`, `cmake`, `curl`, `wget`, `unzip`, `jq`, `tmux`, `rsync`.
- Graphviz.
- `sudo` مضبوط للمستخدم `jovyan` بدون كلمة مرور.
- محتويات مجلد `notebooks/` متاحة داخل `/home/jovyan/`.

## التشغيل عبر Binder

افتح البيئة مباشرة من هذا الرابط:

[![Launch on Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab)

أو استخدم الرابط التالي:

```text
https://mybinder.org/v2/gh/mrx7014/FreeServer-JupyterNotebook/master?urlpath=lab
```

قد يستغرق Binder عدة دقائق في أول تشغيل لأن الصورة تُبنى من `Dockerfile`.

### ملاحظة مهمة عن Binder وsudo

الـ `Dockerfile` يثبت `sudo` ويضيف صلاحيات المستخدم `jovyan` أثناء بناء الصورة. لكن Binder قد يشغل الحاوية مع حماية `no-new-privileges`. إذا ظهر الخطأ:

```text
sudo: The "no new privileges" flag is set
```

فهذا قيد من منصة Binder نفسها، وليس نقصًا في إعدادات هذا المستودع. لا يمكن للـ `Dockerfile` إلغاء هذا القيد من داخل الحاوية.

لتشغيل `sudo apt update` فعليًا، شغّل الصورة محليًا أو على خادم تملك إعداداته.

## التشغيل عبر Docker مع sudo فعلي

استنسخ المستودع وابنِ الصورة:

```bash
git clone https://github.com/mrx7014/FreeServer-JupyterNotebook.git
cd FreeServer-JupyterNotebook
docker build -t free-almond-jupyter .
```

شغّل Jupyter:

```bash
docker run --rm -it \
  --name free-almond-jupyter \
  -p 8888:8888 \
  --security-opt=no-new-privileges:false \
  free-almond-jupyter
```

افتح الرابط الذي يظهر في الطرفية. داخل Terminal في Jupyter، اختبر:

```bash
whoami
sudo -n id
sudo apt update
```

المستخدم الافتراضي هو `jovyan`. البرامج المثبتة في الصورة لا تحتاج إلى `sudo`، أما تثبيت حزم جديدة أثناء التشغيل فيحتاج إلى `sudo` إذا سمحت منصة التشغيل بذلك.

## تشغيل Jupyter كـ root عند الحاجة

يمكن تشغيل الحاوية نفسها كمستخدم root:

```bash
docker run --rm -it \
  --name free-almond-jupyter \
  --user root \
  --security-opt=no-new-privileges:false \
  -p 8888:8888 \
  free-almond-jupyter \
  start-notebook.py --allow-root
```

تشغيل Jupyter كمستخدم `jovyan` مع `sudo` عند الحاجة هو الاختيار المفضل أمنيًا.

## ملفات البناء

- `Dockerfile`: يبني صورة Almond/Jupyter ويثبت أدوات النظام و`sudo`.
- `binder/apt.txt`: قائمة قديمة لحزم Binder؛ عند استخدام `Dockerfile` تكون الحزم الأساسية معرفة في `Dockerfile` نفسه.
- `binder/postBuild`: إعداد قديم لتثبيت Almond يدويًا. الصورة الحالية تأتي بـ Almond جاهز، لذلك لا تحتاج إلى تشغيل تثبيت Almond مرة ثانية.
- `binder/requirements.txt`: متطلبات Python الإضافية القديمة للمشروع.
- `notebooks/`: أمثلة وملفات Notebook التي تُنسخ إلى الصورة.

## إيقاف مهلة الخمول

في بيئة Jupyter التي تدعم ذلك، يمكن تشغيل:

```bash
jupyter notebook --NotebookApp.shutdown_no_activity_timeout=0
```

لكن Binder يفرض حدودًا للوقت والموارد من المنصة نفسها، ولا يمكن للمستودع ضمان جلسة دائمة.

## تنبيه أمني

لا تشغّل سكربتات تمنح root من مستودعات خارجية غير موثوقة. تثبيت الحزم أثناء بناء الصورة هو الأسلوب الآمن والمكرر، أما صلاحيات التشغيل النهائية فتحددها Docker أو Binder أو الخادم الذي يشغل الصورة.

## الترخيص

هذا المشروع مرخص تحت [MIT License](LICENSE).
