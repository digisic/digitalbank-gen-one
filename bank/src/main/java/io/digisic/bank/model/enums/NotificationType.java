package io.digisic.bank.model.enums;

public enum NotificationType {

	WARNING("warning"),
    ALERT("alert"),
    PAYMENT_RECEIVED("payment_received"),
	NEW_ACCOUNT("new_account");

    private final String typeName;

    /**
     * @param text
     */
    NotificationType(final String typeName) {
        this.typeName = typeName;
    }

    /* (non-Javadoc)
     * @see java.lang.Enum#toString()
     */
    @Override
    public String toString() {
        return typeName;
    }
    
}
