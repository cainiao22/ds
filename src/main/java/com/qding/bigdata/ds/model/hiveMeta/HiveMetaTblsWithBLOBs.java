package com.qding.bigdata.ds.model.hiveMeta;

public class HiveMetaTblsWithBLOBs extends HiveMetaTbls {
    private String viewExpandedText;

    private String viewOriginalText;

    public String getViewExpandedText() {
        return viewExpandedText;
    }

    public void setViewExpandedText(String viewExpandedText) {
        this.viewExpandedText = viewExpandedText == null ? null : viewExpandedText.trim();
    }

    public String getViewOriginalText() {
        return viewOriginalText;
    }

    public void setViewOriginalText(String viewOriginalText) {
        this.viewOriginalText = viewOriginalText == null ? null : viewOriginalText.trim();
    }
}