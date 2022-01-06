  import 'package:flutter/material.dart';
  import 'resetAll.dart';

void addNewSemester() {
        var x = this;
        int i = x.addSemesterBtnClickCount + 1;
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