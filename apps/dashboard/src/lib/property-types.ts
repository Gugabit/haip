/** Sentinel value for portfolio (all properties) mode in the property switcher. */
export const PORTFOLIO_MODE_ID = 'portfolio';

export interface PropertySummary {
  id: string;
  name: string;
  code: string;
  /** ISO 3166-1 alpha-2 country code (e.g. "BR"). Used to gate country-specific payment methods like PIX. */
  countryCode?: string | null;
  organizationId?: string | null;
  staffDisplayName?: string | null;
  staffLogoMediaId?: string | null;
  staffLogoUrl?: string | null;
  staffPrimaryColor?: string | null;
  staffAccentColor?: string | null;
  settings?: {
    kpiThresholds?: {
      occupancyRate?: { warnBelow?: number; goodAbove?: number };
      adr?: { warnBelow?: number };
      revpar?: { warnBelow?: number };
      totalRevenue?: { warnBelow?: number };
    };
  } | null;
}

export interface OrganizationSummary {
  id: string;
  name: string;
  code: string;
}
