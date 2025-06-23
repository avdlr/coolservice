package clases;

/**
 * Simple representation of a checklist activity.
 */
public class Activity {
    private String name;

    /**
     * Create an Activity with the given name.
     *
     * @param name descriptive name of the activity
     */
    public Activity(String name) {
        this.name = name;
    }

    /** Default constructor. */
    public Activity() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
