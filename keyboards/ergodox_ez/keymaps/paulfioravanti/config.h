#include "../../config.h"

// https://docs.qmk.fm/reference/config-options
//
/* "debounce" is measured in keyboard scans. Some users reported
 * needing values as high as 15, which was at the time around 50ms.
 * If you don't define it here, the matrix code will default to
 * 5, which is now closer to 10ms, but still plenty according to
 * manufacturer specs.
 *
 * Default is quite high, because of reports with some production
 * runs seeming to need it. This may change when configuration for
 * this is more directly exposed.
 */
// Default: 15
#undef DEBOUNCE
#define DEBOUNCE 5

// tap anyway, even after TAPPING_TERM, if there was no other key
// interruption between press and release
#define RETRO_TAPPING

// how long before a tap becomes a hold
// Default: 200
#undef TAPPING_TERM
#define TAPPING_TERM 50
