/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.acc.action;

/**
 *
 * @author parteek
 */
public class TotalDonationAmountForAllDonationItems {

    public Double getDonatioAmount() {
        return donatioAmount;
    }

    public void setDonatioAmount(Double donatioAmount) {
        this.donatioAmount = donatioAmount;
    }

    public String getDonationItem() {
        return donationItem;
    }

    public void setDonationItem(String donationItem) {
        this.donationItem = donationItem;
    }
    String donationItem=null;
    Double donatioAmount=null;

}
