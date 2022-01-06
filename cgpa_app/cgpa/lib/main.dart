import 'package:flutter/material.dart';
import 'android.os.Bundle';
import 'android.support.annotation.RequiresApi';
import 'android.support.v4.app.Fragment';
import 'android.view.LayoutInflater';
import 'android.view.View';
import 'android.view.ViewGroup';
import 'android.widget.EditText';
import 'android.widget.LinearLayout';
import 'android.widget.TextView';

this=null,

 class CGPAFragment extends Fragment {
     int addSemesterBtnClickCount = 2;
     TextView addSemesterTV;
          EditText cCredit10ET;
          EditText cCredit11ET;
          EditText cCredit12ET;
          EditText cCredit1ET;
          EditText cCredit2ET;
          EditText cCredit3ET;
                    EditText cCredit4ET;
                    EditText cCredit5ET;
                    EditText cCredit6ET;
                    EditText cCredit7ET;
                    EditText cCredit8ET;
                    EditText cCredit9ET;
                    LinearLayout cRaw1;
                                        LinearLayout cRaw10;
                                        LinearLayout cRaw11;
                                        LinearLayout cRaw12;
                                        LinearLayout cRaw2;
                                        LinearLayout cRaw3;
                                        LinearLayout cRaw4;
                                        LinearLayout cRaw5;
                                        LinearLayout cRaw6;
                                        LinearLayout cRaw7;
                                        LinearLayout cRaw8;
                                        LinearLayout cRaw9;
                                        EditText cSGPA_ET1;
                                        EditText cSGPA_ET10;
                                        EditText cSGPA_ET11;
                                        EditText cSGPA_ET12;
                                        EditText cSGPA_ET2;
                                        EditText cSGPA_ET3;
                                        EditText cSGPA_ET4;
                                        EditText cSGPA_ET5;
                                        EditText cSGPA_ET6;
                                        EditText cSGPA_ET7;
                                        EditText cSGPA_ET8;
                                        EditText cSGPA_ET9;
                                        LinearLayout cgpaCalculateLayout;
                                        TextView cgpaCalculateTV;
                                        float credit1;
                                        float credit10;
                                        boolean credit10Empty;
                                        float credit11;
                                        boolean credit11Empty;
                                        float credit12;
                                        boolean credit12Empty;
                                        boolean credit1Empty;
                                        float credit2;
                                        boolean credit2Empty;
                                        float credit3;
                                        boolean credit3Empty;
                                        float credit4;
                                        boolean credit4Empty;
                                        float credit5;
                                        boolean credit5Empty;
                                        float credit6;
                                        boolean credit6Empty;
                                        float credit7;
                                        boolean credit7Empty;
                                        float credit8;
                                        boolean credit8Empty;
                                        float credit9;
                                        boolean credit9Empty;
                                        boolean creditEmpty = false;
                                        boolean cross1;
                                        boolean cross10;
                                        boolean cross11;
                                        boolean cross12;
                                        boolean cross2;
                                        boolean cross3;
                                        boolean cross4;
                                        boolean cross5;
                                        boolean cross6;
                                        boolean cross7;
                                        boolean cross8;
                                        boolean cross9;
                                        boolean finish = false;
                                        InterstitialAd mInterstitialAd;
                                        boolean permission1;
                                        boolean permission10;
                                        boolean permission11;
                                        boolean permission12 = false;
                                        boolean permission2;
                                        boolean permission3;
                                        boolean permission4;
                                        boolean permission5;
                                        boolean permission6;
                                        boolean permission7;
                                        boolean permission8;
                                        boolean permission9;
                                        TextView resetSemesterTV;
                                        float sgpa1;
                                        float sgpa10;
                                        boolean sgpa10Empty;
                                        float sgpa11;
                                        boolean sgpa11Empty;
                                        float sgpa12;
                                        boolean sgpa12Empty;
                                        boolean sgpa1Empty;
                                        float sgpa2;
                                        boolean sgpa2Empty;
                                        float sgpa3;
                                        boolean sgpa3Empty;
                                        float sgpa4;
                                        boolean sgpa4Empty;
                                        float sgpa5;
                                        boolean sgpa5Empty;
                                        float sgpa6;
                                        boolean sgpa6Empty;
                                        float sgpa7;
                                        boolean sgpa7Empty;
                                        float sgpa8;
                                        boolean sgpa8Empty;
                                        float sgpa9;
                                        boolean sgpa9Empty;
                                        boolean sgpaBoundaryCross = false;
                                        boolean sgpaEmpty = false;
                                        View view;
                                    

                                            public void onClick(View v) {
                                                CGPAFragment.this.mInterstitialAd = new InterstitialAd(CGPAFragment.getContext());
                                                getString(C0472R.string.interstitial_full_screen1));
                                                setAdListener(new C07731());
                                                calculateCGPA();
                                            }
                                        }
                                    
                                        /* renamed from: com.juborajsarker.cgpacalculator.fragment.CGPAFragment$4 */
                                        class C04804 implements OnClickListener {
                                    
                                            /* renamed from: com.juborajsarker.cgpacalculator.fragment.CGPAFragment$4$1 */
                                            class C07741 extends AdListener {
                                                C07741() {
                                                }
                                    
                                                public void onAdLoaded() {
                                                    CGPAFragment.this.showInterstitial();
                                                }
                                            }
                                    
                                            C04804() {
                                            }
                                    
                                            
                                             void onClick(View v) {
                                                CGPAFragment.this.mInterstitialAd = new InterstitialAd(CGPAFragment.this.getContext());
                                                CGPAFragment.this.mInterstitialAd.setAdUnitId(CGPAFragment.this.getString(C0472R.string.interstitial_full_screen1));
                                                CGPAFragment.this.mInterstitialAd.loadAd(new Builder().addTestDevice("93448558CC721EBAD8FAAE5DA52596D3").build());
                                                CGPAFragment.this.mInterstitialAd.setAdListener(new C07741());
                                                CGPAFragment.this.calculateCGPA();
                                            }
                                        }
                                    
                                        public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
                                            this.view = inflater.inflate(C0472R.layout.fragment_cgpa, container, false);
                                            init();
                                            return this.view;
                                        }
                                    
                                         void init() {
                                            this.addSemesterTV = (TextView) this.view.findViewById(C0472R.id.add_semester_TV);
                                            this.resetSemesterTV = (TextView) this.view.findViewById(C0472R.id.reset_semester_TV);
                                            this.cgpaCalculateTV = (TextView) this.view.findViewById(C0472R.id.cgpa_calculate_TV);
                                            this.cgpaCalculateLayout = (LinearLayout) this.view.findViewById(C0472R.id.cgpa_calculate_layout);
                                            this.cRaw1 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_1);
                                            this.cRaw2 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_2);
                                            this.cRaw3 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_3);
                                            this.cRaw4 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_4);
                                            this.cRaw5 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_5);
                                            this.cRaw6 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_6);
                                            this.cRaw7 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_7);
                                            this.cRaw8 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_8);
                                            this.cRaw9 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_9);
                                            this.cRaw10 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_10);
                                            this.cRaw11 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_11);
                                            this.cRaw12 = (LinearLayout) this.view.findViewById(C0472R.id.c_raw_12);
                                            this.cCredit1ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET1);
                                            this.cCredit2ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET2);
                                            this.cCredit3ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET3);
                                            this.cCredit4ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET4);
                                            this.cCredit5ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET5);
                                            this.cCredit6ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET6);
                                            this.cCredit7ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET7);
                                            this.cCredit8ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET8);
                                            this.cCredit9ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET9);
                                            this.cCredit10ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET10);
                                            this.cCredit11ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET11);
                                            this.cCredit12ET = (EditText) this.view.findViewById(C0472R.id.c_credit_ET12);
                                            this.cSGPA_ET1 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET1);
                                            this.cSGPA_ET2 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET2);
                                            this.cSGPA_ET3 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET3);
                                            this.cSGPA_ET4 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET4);
                                            this.cSGPA_ET5 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET5);
                                            this.cSGPA_ET6 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET6);
                                            this.cSGPA_ET7 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET7);
                                            this.cSGPA_ET8 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET8);
                                            this.cSGPA_ET9 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET9);
                                            this.cSGPA_ET10 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET10);
                                            this.cSGPA_ET11 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET11);
                                            this.cSGPA_ET12 = (EditText) this.view.findViewById(C0472R.id.c_sgpa_ET12);
                                            this.addSemesterTV.setOnClickListener(new C04771());
                                            this.resetSemesterTV.setOnClickListener(new C04782());
                                            this.cgpaCalculateTV.setOnClickListener(new C04793());
                                            this.cgpaCalculateLayout.setOnClickListener(new C04804());
                                        }
                                    
                                       
                                    
                                       void addNewSemester() {
                                            int i = this.addSemesterBtnClickCount + 1;
                                            this.addSemesterBtnClickCount = i;
                                            switch (i) {
                                                case 3:
                                                    this.cRaw3.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 4:
                                                    this.cRaw4.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 5:
                                                    this.cRaw5.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 6:
                                                    this.cRaw6.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 7:
                                                    this.cRaw7.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 8:
                                                    this.cRaw8.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 9:
                                                    this.cRaw9.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 10:
                                                    this.cRaw10.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 11:
                                                    this.cRaw11.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                case 12:
                                                    this.cRaw12.setVisibility(0);
                                                    this.finish = false;
                                                    return;
                                                default:
                                                    Toast.makeText(getContext(), "Maximum number of Semester has been added", 0).show();
                                                    return;
                                            }
                                        }
                                    
                                        void calculateCGPA() {
                                            getCreditAndSGPA();
                                            if (this.cRaw3.getVisibility() == 0) {
                                                this.finish = false;
                                                if (this.cCredit3ET.getText().toString().equals("")) {
                                                    this.credit3Empty = true;
                                                    this.cCredit3ET.setError("Required");
                                                } else {
                                                    this.credit3Empty = false;
                                                    this.credit3 = Float.parseFloat(this.cCredit3ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET3.getText().toString().equals("")) {
                                                    this.sgpa3Empty = true;
                                                    this.cSGPA_ET3.setError("Required");
                                                } else {
                                                    this.sgpa3Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET3.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET3.setError("SGPA can't greater than must 5.0");
                                                        this.cross3 = true;
                                                    } else {
                                                        this.sgpa3 = Float.parseFloat(this.cSGPA_ET3.getText().toString());
                                                        this.cross3 = false;
                                                    }
                                                }
                                            } else {
                                                this.finish = true;
                                                if (!(this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2)) {
                                                    float cgpa = ((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) / totalCredit;
                                                    float totalSGPA = this.sgpa1 + this.sgpa2;
                                                    new ViewDialog2().showDialog(getActivity(), 2, String.format("%.2f", new Object[]{Float.valueOf(this.credit1 + this.credit2)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                                }
                                            }
                                            if (this.cRaw4.getVisibility() == 0) {
                                                if (this.cCredit4ET.getText().toString().equals("")) {
                                                    this.credit4Empty = true;
                                                    this.cCredit4ET.setError("Required");
                                                } else {
                                                    this.credit4Empty = false;
                                                    this.credit4 = Float.parseFloat(this.cCredit4ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET4.getText().toString().equals("")) {
                                                    this.sgpa4Empty = true;
                                                    this.cSGPA_ET4.setError("Required");
                                                } else {
                                                    this.sgpa4Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET4.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET4.setError("SGPA can't greater than must 5.0");
                                                        this.cross4 = true;
                                                    } else {
                                                        this.sgpa4 = Float.parseFloat(this.cSGPA_ET4.getText().toString());
                                                        this.cross4 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission3) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3)) {
                                                this.finish = true;
                                                this.permission3 = true;
                                                float totalPoint3 = this.credit3 * this.sgpa3;
                                                cgpa = (((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) / totalCredit;
                                                totalSGPA = (this.sgpa1 + this.sgpa2) + this.sgpa3;
                                                new ViewDialog2().showDialog(getActivity(), 3, String.format("%.2f", new Object[]{Float.valueOf((this.credit1 + this.credit2) + this.credit3)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw5.getVisibility() == 0) {
                                                if (this.cCredit5ET.getText().toString().equals("")) {
                                                    this.credit5Empty = true;
                                                    this.cCredit5ET.setError("Required");
                                                } else {
                                                    this.credit5Empty = false;
                                                    this.credit5 = Float.parseFloat(this.cCredit5ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET5.getText().toString().equals("")) {
                                                    this.sgpa5Empty = true;
                                                    this.cSGPA_ET5.setError("Required");
                                                } else {
                                                    this.sgpa5Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET5.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET5.setError("SGPA can't greater than must 5.0");
                                                        this.cross5 = true;
                                                    } else {
                                                        this.sgpa5 = Float.parseFloat(this.cSGPA_ET5.getText().toString());
                                                        this.cross5 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission4) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4)) {
                                                this.finish = true;
                                                this.permission4 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                float totalPoint4 = this.credit4 * this.sgpa4;
                                                cgpa = ((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) / totalCredit;
                                                totalSGPA = ((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4;
                                                new ViewDialog2().showDialog(getActivity(), 4, String.format("%.2f", new Object[]{Float.valueOf(((this.credit1 + this.credit2) + this.credit3) + this.credit4)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw6.getVisibility() == 0) {
                                                if (this.cCredit6ET.getText().toString().equals("")) {
                                                    this.credit6Empty = true;
                                                    this.cCredit6ET.setError("Required");
                                                } else {
                                                    this.credit6Empty = false;
                                                    this.credit6 = Float.parseFloat(this.cCredit6ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET6.getText().toString().equals("")) {
                                                    this.sgpa6Empty = true;
                                                    this.cSGPA_ET6.setError("Required");
                                                } else {
                                                    this.sgpa6Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET6.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET6.setError("SGPA can't greater than must 5.0");
                                                        this.cross6 = true;
                                                    } else {
                                                        this.sgpa6 = Float.parseFloat(this.cSGPA_ET6.getText().toString());
                                                        this.cross6 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission5) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5)) {
                                                this.finish = true;
                                                this.permission5 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                float totalPoint5 = this.credit5 * this.sgpa5;
                                                cgpa = (((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) / totalCredit;
                                                totalSGPA = (((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5;
                                                new ViewDialog2().showDialog(getActivity(), 5, String.format("%.2f", new Object[]{Float.valueOf((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw7.getVisibility() == 0) {
                                                if (this.cCredit7ET.getText().toString().equals("")) {
                                                    this.credit7Empty = true;
                                                    this.cCredit7ET.setError("Required");
                                                } else {
                                                    this.credit7Empty = false;
                                                    this.credit7 = Float.parseFloat(this.cCredit7ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET7.getText().toString().equals("")) {
                                                    this.sgpa7Empty = true;
                                                    this.cSGPA_ET7.setError("Required");
                                                } else {
                                                    this.sgpa7Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET7.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET7.setError("SGPA can't greater than must 5.0");
                                                        this.cross7 = true;
                                                    } else {
                                                        this.sgpa7 = Float.parseFloat(this.cSGPA_ET7.getText().toString());
                                                        this.cross7 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission6) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6)) {
                                                this.finish = true;
                                                this.permission6 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                float totalPoint6 = this.credit6 * this.sgpa6;
                                                cgpa = ((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) / totalCredit;
                                                totalSGPA = ((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6;
                                                new ViewDialog2().showDialog(getActivity(), 6, String.format("%.2f", new Object[]{Float.valueOf(((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw8.getVisibility() == 0) {
                                                if (this.cCredit8ET.getText().toString().equals("")) {
                                                    this.credit8Empty = true;
                                                    this.cCredit8ET.setError("Required");
                                                } else {
                                                    this.credit8Empty = false;
                                                    this.credit8 = Float.parseFloat(this.cCredit8ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET8.getText().toString().equals("")) {
                                                    this.sgpa8Empty = true;
                                                    this.cSGPA_ET8.setError("Required");
                                                } else {
                                                    this.sgpa8Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET8.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET8.setError("SGPA can't greater than must 5.0");
                                                        this.cross8 = true;
                                                    } else {
                                                        this.sgpa8 = Float.parseFloat(this.cSGPA_ET8.getText().toString());
                                                        this.cross8 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission7) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6 || this.credit7Empty || this.sgpa7Empty || this.cross7)) {
                                                this.finish = true;
                                                this.permission7 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                totalPoint6 = this.credit6 * this.sgpa6;
                                                float totalPoint7 = this.credit7 * this.sgpa7;
                                                cgpa = (((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) / totalCredit;
                                                totalSGPA = (((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7;
                                                new ViewDialog2().showDialog(getActivity(), 7, String.format("%.2f", new Object[]{Float.valueOf((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw9.getVisibility() == 0) {
                                                if (this.cCredit9ET.getText().toString().equals("")) {
                                                    this.credit9Empty = true;
                                                    this.cCredit9ET.setError("Required");
                                                } else {
                                                    this.credit9Empty = false;
                                                    this.credit9 = Float.parseFloat(this.cCredit9ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET9.getText().toString().equals("")) {
                                                    this.sgpa9Empty = true;
                                                    this.cSGPA_ET9.setError("Required");
                                                } else {
                                                    this.sgpa9Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET9.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET9.setError("SGPA can't greater than must 5.0");
                                                        this.cross9 = true;
                                                    } else {
                                                        this.sgpa9 = Float.parseFloat(this.cSGPA_ET9.getText().toString());
                                                        this.cross9 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission8) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6 || this.credit7Empty || this.sgpa7Empty || this.cross7 || this.credit8Empty || this.sgpa8Empty || this.cross8)) {
                                                this.finish = true;
                                                this.permission8 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                totalPoint6 = this.credit6 * this.sgpa6;
                                                totalPoint7 = this.credit7 * this.sgpa7;
                                                float totalPoint8 = this.credit8 * this.sgpa8;
                                                cgpa = ((((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) + totalPoint8) / totalCredit;
                                                totalSGPA = ((((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7) + this.sgpa8;
                                                new ViewDialog2().showDialog(getActivity(), 8, String.format("%.2f", new Object[]{Float.valueOf(((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7) + this.credit8)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw10.getVisibility() == 0) {
                                                if (this.cCredit10ET.getText().toString().equals("")) {
                                                    this.credit10Empty = true;
                                                    this.cCredit10ET.setError("Required");
                                                } else {
                                                    this.credit10Empty = false;
                                                    this.credit10 = Float.parseFloat(this.cCredit10ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET10.getText().toString().equals("")) {
                                                    this.sgpa10Empty = true;
                                                    this.cSGPA_ET10.setError("Required");
                                                } else {
                                                    this.sgpa10Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET10.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET10.setError("SGPA can't greater than must 5.0");
                                                        this.cross10 = true;
                                                    } else {
                                                        this.sgpa10 = Float.parseFloat(this.cSGPA_ET10.getText().toString());
                                                        this.cross10 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission9) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6 || this.credit7Empty || this.sgpa7Empty || this.cross7 || this.credit8Empty || this.sgpa8Empty || this.cross8 || this.credit9Empty || this.sgpa9Empty || this.cross9)) {
                                                this.finish = true;
                                                this.permission9 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                totalPoint6 = this.credit6 * this.sgpa6;
                                                totalPoint7 = this.credit7 * this.sgpa7;
                                                totalPoint8 = this.credit8 * this.sgpa8;
                                                float totalPoint9 = this.credit9 * this.sgpa9;
                                                cgpa = (((((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) + totalPoint8) + totalPoint9) / totalCredit;
                                                totalSGPA = (((((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7) + this.sgpa8) + this.sgpa9;
                                                new ViewDialog2().showDialog(getActivity(), 9, String.format("%.2f", new Object[]{Float.valueOf((((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7) + this.credit8) + this.credit9)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw11.getVisibility() == 0) {
                                                if (this.cCredit11ET.getText().toString().equals("")) {
                                                    this.credit11Empty = true;
                                                    this.cCredit11ET.setError("Required");
                                                } else {
                                                    this.credit11Empty = false;
                                                    this.credit11 = Float.parseFloat(this.cCredit11ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET11.getText().toString().equals("")) {
                                                    this.sgpa11Empty = true;
                                                    this.cSGPA_ET11.setError("Required");
                                                } else {
                                                    this.sgpa11Empty = false;
                                                    if (((double) Float.parseFloat(this.cSGPA_ET11.getText().toString())) > 5.0d) {
                                                        this.cSGPA_ET11.setError("SGPA can't greater than must 5.0");
                                                        this.cross11 = true;
                                                    } else {
                                                        this.sgpa11 = Float.parseFloat(this.cSGPA_ET11.getText().toString());
                                                        this.cross11 = false;
                                                    }
                                                }
                                            } else if (!((this.finish && !this.permission10) || this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6 || this.credit7Empty || this.sgpa7Empty || this.cross7 || this.credit8Empty || this.sgpa8Empty || this.cross8 || this.credit9Empty || this.sgpa9Empty || this.cross9 || this.credit10Empty || this.sgpa10Empty || this.cross10)) {
                                                this.finish = true;
                                                this.permission10 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                totalPoint6 = this.credit6 * this.sgpa6;
                                                totalPoint7 = this.credit7 * this.sgpa7;
                                                totalPoint8 = this.credit8 * this.sgpa8;
                                                totalPoint9 = this.credit9 * this.sgpa9;
                                                float totalPoint10 = this.credit10 * this.sgpa10;
                                                cgpa = ((((((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) + totalPoint8) + totalPoint9) + totalPoint10) / totalCredit;
                                                totalSGPA = ((((((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7) + this.sgpa8) + this.sgpa9) + this.sgpa10;
                                                new ViewDialog2().showDialog(getActivity(), 10, String.format("%.2f", new Object[]{Float.valueOf(((((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7) + this.credit8) + this.credit9) + this.credit10)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                            if (this.cRaw12.getVisibility() == 0) {
                                                if (this.cCredit12ET.getText().toString().equals("")) {
                                                    this.credit12Empty = true;
                                                    this.cCredit12ET.setError("Required");
                                                } else {
                                                    this.credit12Empty = false;
                                                    this.credit12 = Float.parseFloat(this.cCredit12ET.getText().toString());
                                                }
                                                if (this.cSGPA_ET12.getText().toString().equals("")) {
                                                    this.sgpa12Empty = true;
                                                    this.cSGPA_ET12.setError("Required");
                                                    return;
                                                }
                                                this.sgpa12Empty = false;
                                                if (((double) Float.parseFloat(this.cSGPA_ET12.getText().toString())) > 5.0d) {
                                                    this.cSGPA_ET12.setError("SGPA can't greater than must 5.0");
                                                    this.cross12 = true;
                                                } else {
                                                    this.sgpa12 = Float.parseFloat(this.cSGPA_ET12.getText().toString());
                                                    this.cross12 = false;
                                                }
                                                doFinal();
                                            } else if ((!this.finish || this.permission11) && !this.credit1Empty && !this.sgpa1Empty && !this.cross1 && !this.credit2Empty && !this.sgpa2Empty && !this.cross2 && !this.credit3Empty && !this.sgpa3Empty && !this.cross3 && !this.credit4Empty && !this.sgpa4Empty && !this.cross4 && !this.credit5Empty && !this.sgpa5Empty && !this.cross5 && !this.credit6Empty && !this.sgpa6Empty && !this.cross6 && !this.credit7Empty && !this.sgpa7Empty && !this.cross7 && !this.credit8Empty && !this.sgpa8Empty && !this.cross8 && !this.credit9Empty && !this.sgpa9Empty && !this.cross9 && !this.credit10Empty && !this.sgpa10Empty && !this.cross10 && !this.credit11Empty && !this.sgpa11Empty && !this.cross11) {
                                                this.finish = true;
                                                this.permission11 = true;
                                                totalPoint3 = this.credit3 * this.sgpa3;
                                                totalPoint4 = this.credit4 * this.sgpa4;
                                                totalPoint5 = this.credit5 * this.sgpa5;
                                                totalPoint6 = this.credit6 * this.sgpa6;
                                                totalPoint7 = this.credit7 * this.sgpa7;
                                                totalPoint8 = this.credit8 * this.sgpa8;
                                                totalPoint9 = this.credit9 * this.sgpa9;
                                                totalPoint10 = this.credit10 * this.sgpa10;
                                                float totalPoint11 = this.credit11 * this.sgpa11;
                                                cgpa = (((((((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) + totalPoint8) + totalPoint9) + totalPoint10) + totalPoint11) / totalCredit;
                                                totalSGPA = (((((((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7) + this.sgpa8) + this.sgpa9) + this.sgpa10) + this.sgpa11;
                                                new ViewDialog2().showDialog(getActivity(), 11, String.format("%.2f", new Object[]{Float.valueOf((((((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7) + this.credit8) + this.credit9) + this.credit10) + this.credit11)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                            }
                                        }
                                    
                                        @override
                                           void doFinal() {
                                            if (this.credit1Empty || this.sgpa1Empty || this.cross1 || this.credit2Empty || this.sgpa2Empty || this.cross2 || this.credit3Empty || this.sgpa3Empty || this.cross3 || this.credit4Empty || this.sgpa4Empty || this.cross4 || this.credit5Empty || this.sgpa5Empty || this.cross5 || this.credit6Empty || this.sgpa6Empty || this.cross6 || this.credit7Empty || this.sgpa7Empty || this.cross7 || this.credit8Empty || this.sgpa8Empty || this.cross8 || this.credit9Empty || this.sgpa9Empty || this.cross9 || this.credit10Empty || this.sgpa10Empty || this.cross10 || this.credit11Empty || this.sgpa11Empty || this.cross11 || this.credit12Empty || this.sgpa12Empty || this.cross12) {
                                                Toast.makeText(getContext(), "Error... Please check ", 0).show();
                                                return;
                                            }
                                            this.finish = true;
                                            this.permission11 = true;
                                            float totalPoint3 = this.credit3 * this.sgpa3;
                                            float totalPoint4 = this.credit4 * this.sgpa4;
                                            float totalPoint5 = this.credit5 * this.sgpa5;
                                            float totalPoint6 = this.credit6 * this.sgpa6;
                                            float totalPoint7 = this.credit7 * this.sgpa7;
                                            float totalPoint8 = this.credit8 * this.sgpa8;
                                            float totalPoint9 = this.credit9 * this.sgpa9;
                                            float totalPoint10 = this.credit10 * this.sgpa10;
                                            float totalPoint11 = this.credit11 * this.sgpa11;
                                            float totalPoint12 = this.credit12 * this.sgpa12;
                                            float cgpa = ((((((((((((this.credit1 * this.sgpa1) + (this.credit2 * this.sgpa2)) + totalPoint3) + totalPoint4) + totalPoint5) + totalPoint6) + totalPoint7) + totalPoint8) + totalPoint9) + totalPoint10) + totalPoint11) + totalPoint12) / totalCredit;
                                            float totalSGPA = ((((((((((this.sgpa1 + this.sgpa2) + this.sgpa3) + this.sgpa4) + this.sgpa5) + this.sgpa6) + this.sgpa7) + this.sgpa8) + this.sgpa9) + this.sgpa10) + this.sgpa11) + this.sgpa12;
                                            new ViewDialog2().showDialog(getActivity(), 12, String.format("%.2f", new Object[]{Float.valueOf(((((((((((this.credit1 + this.credit2) + this.credit3) + this.credit4) + this.credit5) + this.credit6) + this.credit7) + this.credit8) + this.credit9) + this.credit10) + this.credit11) + this.credit12)}), String.format("%.2f", new Object[]{Float.valueOf(totalSGPA)}), String.format("%.2f", new Object[]{Float.valueOf(cgpa)}));
                                        }
                                    
                                         void getCreditAndSGPA() {
                                            if (this.cCredit1ET.getText().toString().equals("")) {
                                                this.credit1Empty = true;
                                                this.cCredit1ET.setError("Required");
                                            } else {
                                                this.credit1Empty = false;
                                                this.credit1 = Float.parseFloat(this.cCredit1ET.getText().toString());
                                            }
                                            if (this.cCredit2ET.getText().toString().equals("")) {
                                                this.credit2Empty = true;
                                                this.cCredit2ET.setError("Required");
                                            } else {
                                                this.credit2Empty = false;
                                                this.credit2 = Float.parseFloat(this.cCredit2ET.getText().toString());
                                            }
                                            if (this.cSGPA_ET1.getText().toString().equals("")) {
                                                this.sgpa1Empty = true;
                                                this.cSGPA_ET1.setError("Required");
                                            } else {
                                                this.sgpa1Empty = false;
                                                if (((double) Float.parseFloat(this.cSGPA_ET1.getText().toString())) > 5.0d) {
                                                    this.cSGPA_ET1.setError("SGPA can't greater than must 5.0");
                                                    this.cross1 = true;
                                                } else {
                                                    this.sgpa1 = Float.parseFloat(this.cSGPA_ET1.getText().toString());
                                                    this.cross1 = false;
                                                }
                                            }
                                            if (this.cSGPA_ET2.getText().toString().equals("")) {
                                                this.cSGPA_ET2.setError("Required");
                                                this.sgpa2Empty = true;
                                                return;
                                            }
                                            this.sgpa2Empty = false;
                                            if (((double) Float.parseFloat(this.cSGPA_ET2.getText().toString())) > 5.0d) {
                                                this.cSGPA_ET2.setError("SGPA can't greater than must 5.0");
                                                this.cross2 = true;
                                                return;
                                            }
                                            this.sgpa2 = Float.parseFloat(this.cSGPA_ET2.getText().toString());
                                            this.cross2 = false;
                                        }
                                    
                                         void showInterstitial() {
                                            if (this.mInterstitialAd.isLoaded()) {
                                                this.mInterstitialAd.show();
                                            }
                                        }
                                    }

mixin View {
}

