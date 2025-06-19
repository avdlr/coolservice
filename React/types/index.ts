export interface Activity {
  name: string;
}

export interface Section {
  id: string;
  title: string;
  activities: Activity[];
}

export interface ServiceItem {
  id: number;
  quantity: string;
  parts: string;
  description: string;
}