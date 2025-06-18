package zntclases;

import java.util.List;

/**
 * Represents a checklist section containing multiple activities.
 */
public class Section {
    private String id;
    private String title;
    private List<Activity> activities;

    /**
     * Creates a new Section.
     *
     * @param id         short identifier used as HTML anchor or key
     * @param title      descriptive title shown to the user
     * @param activities list of activities associated with the section
     */
    public Section(String id, String title, List<Activity> activities) {
        this.id = id;
        this.title = title;
        this.activities = activities;
    }

    /** Default constructor. */
    public Section() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public List<Activity> getActivities() {
        return activities;
    }

    public void setActivities(List<Activity> activities) {
        this.activities = activities;
    }
}
