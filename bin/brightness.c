/* Copyright Jake Addis 2023 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define INVALID_INDEX -1
#define MAX_BRIGHNESS_DIGITS 5  // "1050" + \n
#define NUM_SETTINGS 11         // 0-100% by 10s
#define HIGHEST_SETTING 10
#define LOWEST_SETTING 0
#define INCREMENT 'u'
#define DECREMENT 'd'
#define BRIGHTNESS_FILE_PATH \
  "/sys/class/backlight/intel_backlight/brightness"


int main(int argc, char** argv) {
  char* settings[NUM_SETTINGS] = {
    "0", "105", "210", "315", "420", "525", "630", "735", "840", "945", "1050"
  };
  char buffer[MAX_BRIGHNESS_DIGITS + 1];  // Adds room for null terminator
  int new_settings_idx = INVALID_INDEX,
      current_settings_idx = INVALID_INDEX;
  size_t len;

  if (argc < 2) {
    perror("Did not pass argument\n");
    return EXIT_FAILURE;
  }
  char operation = argv[1][1];  // parses 'u' or 'd' from "-u" or "-d"
  if (operation != INCREMENT && operation != DECREMENT) {
    perror("Did not pass appropriate argument\n");
    return EXIT_FAILURE;
  }

  FILE *f = fopen(BRIGHTNESS_FILE_PATH, "r+");
  if (f == NULL) {
    perror("Error opening file\n");
    return EXIT_FAILURE;
  }
  if (fgets(buffer, sizeof(buffer), f) == NULL) {
    perror("Error reading file\n");
    fclose(f);
    return EXIT_FAILURE;
  }
  fseek(f, 0, SEEK_SET);

  len = strlen(buffer);
  if (len > 0 && buffer[len - 1] == '\n')
    buffer[len - 1] = '\0';

  for (int i = 0; i < NUM_SETTINGS; i++) {
    if (strcmp(settings[i], buffer) == 0) {
      current_settings_idx = i;
      break;
    }
  }

  if (current_settings_idx == INVALID_INDEX) {
    perror("Brightness does not match existing setting\n");
    fclose(f);
    return EXIT_FAILURE;
  }

  switch (operation) {
    case INCREMENT:
      new_settings_idx = (
          current_settings_idx < HIGHEST_SETTING ? current_settings_idx + 1
                                                 : HIGHEST_SETTING);
      break;
    case DECREMENT:
      new_settings_idx = (
          current_settings_idx > LOWEST_SETTING ? current_settings_idx - 1
                                                : LOWEST_SETTING);
      break;
  }

  snprintf(buffer, sizeof(buffer), "%s", settings[new_settings_idx]);
  fprintf(f, "%s\n", buffer);

  fclose(f);

  return EXIT_SUCCESS;
}
