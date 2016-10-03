package com.zlzkj.app.model;

public class MakerParts {
    private Integer id;

    private String partsId;

    private String partsName;

    private String partsDescription;

    private String partsProductiontime;

    private String partsProductionarea;

    private String partsBelongs;

    private String partsSignatureOne;

    private String partsFirstSigntime;

    private String partsSignatureTwo;

    private String partsSecondSigntime;

    private Integer partsStatus;

    private String partsPicture;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPartsId() {
        return partsId;
    }

    public void setPartsId(String partsId) {
        this.partsId = partsId == null ? null : partsId.trim();
    }

    public String getPartsName() {
        return partsName;
    }

    public void setPartsName(String partsName) {
        this.partsName = partsName == null ? null : partsName.trim();
    }

    public String getPartsDescription() {
        return partsDescription;
    }

    public void setPartsDescription(String partsDescription) {
        this.partsDescription = partsDescription == null ? null : partsDescription.trim();
    }

    public String getPartsProductiontime() {
        return partsProductiontime;
    }

    public void setPartsProductiontime(String partsProductiontime) {
        this.partsProductiontime = partsProductiontime == null ? null : partsProductiontime.trim();
    }

    public String getPartsProductionarea() {
        return partsProductionarea;
    }

    public void setPartsProductionarea(String partsProductionarea) {
        this.partsProductionarea = partsProductionarea == null ? null : partsProductionarea.trim();
    }

    public String getPartsBelongs() {
        return partsBelongs;
    }

    public void setPartsBelongs(String partsBelongs) {
        this.partsBelongs = partsBelongs == null ? null : partsBelongs.trim();
    }

    public String getPartsSignatureOne() {
        return partsSignatureOne;
    }

    public void setPartsSignatureOne(String partsSignatureOne) {
        this.partsSignatureOne = partsSignatureOne == null ? null : partsSignatureOne.trim();
    }

    public String getPartsFirstSigntime() {
        return partsFirstSigntime;
    }

    public void setPartsFirstSigntime(String partsFirstSigntime) {
        this.partsFirstSigntime = partsFirstSigntime == null ? null : partsFirstSigntime.trim();
    }

    public String getPartsSignatureTwo() {
        return partsSignatureTwo;
    }

    public void setPartsSignatureTwo(String partsSignatureTwo) {
        this.partsSignatureTwo = partsSignatureTwo == null ? null : partsSignatureTwo.trim();
    }

    public String getPartsSecondSigntime() {
        return partsSecondSigntime;
    }

    public void setPartsSecondSigntime(String partsSecondSigntime) {
        this.partsSecondSigntime = partsSecondSigntime == null ? null : partsSecondSigntime.trim();
    }

    public Integer getPartsStatus() {
        return partsStatus;
    }

    public void setPartsStatus(Integer partsStatus) {
        this.partsStatus = partsStatus;
    }

    public String getPartsPicture() {
        return partsPicture;
    }

    public void setPartsPicture(String partsPicture) {
        this.partsPicture = partsPicture == null ? null : partsPicture.trim();
    }
}