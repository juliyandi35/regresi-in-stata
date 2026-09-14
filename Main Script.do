* 0. Sesuaikan working directory (atur alamatnya sesuai dengan lokasi folder yang ada di laptop anda)
cd "D:/Kerjaan/Research Consultant/Project Regresi in STATA"

* 1. Import data
use "https://stats.idre.ucla.edu/stat/stata/webbooks/reg/elemapi", clear

* 2. Statistik deskriptif untuk variabel tertentu
summarize api00 acs_k3 meals full enroll

* 3. Regresi pertama tanpa col_grad
regress api00 acs_k3 meals full

* 4. Buat plotnya dan interpretasikan hasil regresinya, simpan hasil regresi sebagai grafik koefisien

* jangan lupa jalankan syntax ssc install coefplot di bawah jika belum menginstall coefplotnya
* ssc install coefplot

coefplot, drop(_cons) xline(0) title("Koefisien regresi model 1 (tanpa col_grad)") saving(coef1.gph, replace)
graph use coef1.gph
graph export "coefplot1.png", replace

* 5. Tambahkan variabel col_grad dan lakukan regresi ulang
regress api00 acs_k3 meals full col_grad

* Simpan grafik koefisien baru
coefplot, drop(_cons) xline(0) title("Koefisien regresi model 2 (dengan col_grad)") saving(coef2.gph, replace)
graph use coef2.gph
graph export "coefplot2.png", replace
