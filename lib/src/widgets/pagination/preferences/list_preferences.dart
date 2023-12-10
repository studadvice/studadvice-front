/// Wraps the filtering and sorting options for a list of articles.
class ListPreferences {
  ListPreferences({
    this.filteredPlatformIds,
  });
  final List<int>? filteredPlatformIds;
}
