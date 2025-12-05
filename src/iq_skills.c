#include "iq_skills.h"

const s32 IQ_SKILLS[69] =
{
    9999,       // IQ_NONE
    105,        // IQ_TYPE_ADVANTAGE_MASTER
    -1,         // IQ_ITEM_CATCHER
    -1,         // IQ_COURSE_CHECKER
    500,        // IQ_SURE_HIT_ATTACKER
    540,        // IQ_QUICK_DODGER
    9999,       // IQ_PP_CHECKER
    40,         // IQ_NONTRAITOR
    25,         // IQ_STATUS_CHECKER
    200,        // IQ_EXP_GO_GETTER
    10,         // IQ_EFFICIENCY_EXPERT
    125,        // IQ_WEAK_TYPE_PICKER
    400,        // IQ_ALL_TERRAIN_HIKER
    990,        // IQ_ABSOLUTE_MOVER
    240,        // IQ_TRAP_AVOIDER
    800,        // IQ_HOUSE_AVOIDER
    250,        // IQ_ENERGY_SAVER
    160,        // IQ_NONSLEEPER
    70,         // IQ_SELF_CURER
    600,        // IQ_TRAP_SEER
    300,        // IQ_LAVA_EVADER
    1,          // IQ_DEDICATED_TRAVELER
    -1,         // IQ_ITEM_MASTER
    -1,         // IQ_EXCLUSIVE_MOVE_USER
    1,          // IQ_ESCAPIST
    9999,       // IQ_LOCK_PICKER
    480,        // IQ_STAIR_SENSOR
    150,        // IQ_COIN_WATCHER
    320,        // IQ_EXP_ELITE
    260,        // IQ_SHARPSHOOTER
    550,        // IQ_FAST_FRIEND
    55,         // IQ_PP_SAVER
    65,         // IQ_BODYGUARD
    9999,       // IQ_CAUTIOUS_CREEPER
    220,        // IQ_AGGRESSOR
    230,        // IQ_DEFENDER
    560,        // IQ_INTIMIDATOR
    140,        // IQ_SURVIVALIST
    420,        // IQ_TRAP_BUSTER
    330,        // IQ_COUNTER_HITTER
    520,        // IQ_EXTRA_STRIKER
    270,        // IQ_HIT_AND_RUNNER
    9999,       // IQ_PARRY_EXPERT
    750,        // IQ_QUICK_STRIKER
    570,        // IQ_NO_CHARGER
    180,        // IQ_WARY_FIGHTER
    170,        // IQ_GAP_PROBER
    130,        // IQ_POWER_PITCHER
    185,        // IQ_CONCENTRATOR
    280,        // IQ_COUNTER_BASHER
    30,         // IQ_CHEERLEADER
    900,        // IQ_NATURE_GIFTER
    175,        // IQ_WISE_HEALER
    290,        // IQ_QUICK_HEALER
    50,         // IQ_ACUTE_SNIFFER
    190,        // IQ_DEEP_BREATHER
    100,        // IQ_BRICK_TOUGH
    310,        // IQ_MULTITALENT
    950,        // IQ_TIME_TRIPPER
    340,        // IQ_ERRATIC_PLAYER
    195,        // IQ_PRACTICE_SWINGER
    9999,       // IQ_NO_DEFEATIST
    350,        // IQ_HAGGLER
    360,        // IQ_CLUTCH_PERFORMER
    440,        // IQ_CRITICAL_DODGER
    580,        // IQ_MAP_SURVEYOR
    850,        // IQ_PIERCE_HURLER
    370,        // IQ_COLLECTOR
    9999,       // IQ_TRUE_POWERIST
};

const enum iq_skill_id IQ_GROUP_SKILLS[16][25] =
{
    // Group A
    {
        IQ_ESCAPIST,
        IQ_STAIR_SENSOR,
        IQ_COIN_WATCHER,
        IQ_PP_SAVER,
        IQ_SURVIVALIST,
        IQ_TRAP_BUSTER,
        IQ_ACUTE_SNIFFER,
        IQ_MULTITALENT,
        IQ_HAGGLER,
        IQ_MAP_SURVEYOR,
        IQ_PIERCE_HURLER,
        IQ_COLLECTOR,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_TYPE_ADVANTAGE_MASTER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_DEDICATED_TRAVELER,
        IQ_ALL_TERRAIN_HIKER,
        IQ_HOUSE_AVOIDER,
        IQ_LAVA_EVADER,
        IQ_ITEM_CATCHER,
        IQ_NONSLEEPER,
        IQ_NONE_2
    },
    // Group B
    {
        IQ_ESCAPIST,
        IQ_COIN_WATCHER,
        IQ_FAST_FRIEND,
        IQ_BODYGUARD,
        IQ_TRAP_BUSTER,
        IQ_GAP_PROBER,
        IQ_CHEERLEADER,
        IQ_NATURE_GIFTER,
        IQ_WISE_HEALER,
        IQ_DEEP_BREATHER,
        IQ_HAGGLER,
        IQ_PIERCE_HURLER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_TYPE_ADVANTAGE_MASTER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_DEDICATED_TRAVELER,
        IQ_HOUSE_AVOIDER,
        IQ_TRAP_SEER,
        IQ_ITEM_CATCHER,
        IQ_NONSLEEPER,
        IQ_LAVA_EVADER,
        IQ_NONE_2
    },
    // Group C
    {
        IQ_ESCAPIST,
        IQ_AGGRESSOR,
        IQ_INTIMIDATOR,
        IQ_SURVIVALIST,
        IQ_EXTRA_STRIKER,
        IQ_NO_CHARGER,
        IQ_POWER_PITCHER,
        IQ_CONCENTRATOR,
        IQ_COUNTER_BASHER,
        IQ_BRICK_TOUGH,
        IQ_ERRATIC_PLAYER,
        IQ_PRACTICE_SWINGER,
        IQ_CLUTCH_PERFORMER,
        IQ_PIERCE_HURLER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_TYPE_ADVANTAGE_MASTER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_EXP_GO_GETTER,
        IQ_ITEM_CATCHER,
        IQ_NONSLEEPER,
        IQ_LAVA_EVADER,
        IQ_NONE_2
    },
    // Group D
    {
        IQ_ESCAPIST,
        IQ_STAIR_SENSOR,
        IQ_SHARPSHOOTER,
        IQ_PP_SAVER,
        IQ_COUNTER_HITTER,
        IQ_EXTRA_STRIKER,
        IQ_QUICK_STRIKER,
        IQ_GAP_PROBER,
        IQ_CONCENTRATOR,
        IQ_PRACTICE_SWINGER,
        IQ_CLUTCH_PERFORMER,
        IQ_CRITICAL_DODGER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_DEDICATED_TRAVELER,
        IQ_TRAP_AVOIDER,
        IQ_SELF_CURER,
        IQ_TRAP_SEER,
        IQ_ITEM_CATCHER,
        IQ_QUICK_DODGER,
        IQ_LAVA_EVADER,
        IQ_NONE_2
    },
    // Group E
    {
        IQ_ESCAPIST,
        IQ_BODYGUARD,
        IQ_DEFENDER,
        IQ_INTIMIDATOR,
        IQ_SURVIVALIST,
        IQ_COUNTER_HITTER,
        IQ_WARY_FIGHTER,
        IQ_POWER_PITCHER,
        IQ_CHEERLEADER,
        IQ_WISE_HEALER,
        IQ_QUICK_HEALER,
        IQ_DEEP_BREATHER,
        IQ_BRICK_TOUGH,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_SURE_HIT_ATTACKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_EFFICIENCY_EXPERT,
        IQ_HOUSE_AVOIDER,
        IQ_ITEM_CATCHER,
        IQ_ENERGY_SAVER,
        IQ_LAVA_EVADER,
        IQ_NONE_2
    },
    // Group F
    {
        IQ_ESCAPIST,
        IQ_STAIR_SENSOR,
        IQ_EXP_ELITE,
        IQ_SHARPSHOOTER,
        IQ_PP_SAVER,
        IQ_TRAP_BUSTER,
        IQ_HIT_AND_RUNNER,
        IQ_NO_CHARGER,
        IQ_WARY_FIGHTER,
        IQ_GAP_PROBER,
        IQ_MULTITALENT,
        IQ_PIERCE_HURLER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_TYPE_ADVANTAGE_MASTER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_WEAK_TYPE_PICKER,
        IQ_ALL_TERRAIN_HIKER,
        IQ_HOUSE_AVOIDER,
        IQ_SELF_CURER,
        IQ_LAVA_EVADER,
        IQ_ITEM_CATCHER,
        IQ_NONE_2
    },
    // Group G
    {
        IQ_ESCAPIST,
        IQ_STAIR_SENSOR,
        IQ_EXP_ELITE,
        IQ_PP_SAVER,
        IQ_HIT_AND_RUNNER,
        IQ_QUICK_STRIKER,
        IQ_QUICK_HEALER,
        IQ_ACUTE_SNIFFER,
        IQ_ERRATIC_PLAYER,
        IQ_PRACTICE_SWINGER,
        IQ_CRITICAL_DODGER,
        IQ_MAP_SURVEYOR,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_EXP_GO_GETTER,
        IQ_TRAP_AVOIDER,
        IQ_SELF_CURER,
        IQ_TRAP_SEER,
        IQ_ITEM_CATCHER,
        IQ_QUICK_DODGER,
        IQ_LAVA_EVADER,
        IQ_NONE_2
    },
    // Group H
    {
        IQ_ESCAPIST,
        IQ_COIN_WATCHER,
        IQ_FAST_FRIEND,
        IQ_BODYGUARD,
        IQ_TRAP_BUSTER,
        IQ_WARY_FIGHTER,
        IQ_NATURE_GIFTER,
        IQ_WISE_HEALER,
        IQ_QUICK_HEALER,
        IQ_DEEP_BREATHER,
        IQ_BRICK_TOUGH,
        IQ_CRITICAL_DODGER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_EFFICIENCY_EXPERT,
        IQ_ALL_TERRAIN_HIKER,
        IQ_HOUSE_AVOIDER,
        IQ_SELF_CURER,
        IQ_LAVA_EVADER,
        IQ_ITEM_CATCHER,
        IQ_QUICK_DODGER,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2
    },
    // Group I
    {
        IQ_ESCAPIST,
        IQ_SHARPSHOOTER,
        IQ_AGGRESSOR,
        IQ_INTIMIDATOR,
        IQ_SURVIVALIST,
        IQ_EXTRA_STRIKER,
        IQ_PP_SAVER,
        IQ_POWER_PITCHER,
        IQ_QUICK_HEALER,
        IQ_DEEP_BREATHER,
        IQ_TIME_TRIPPER,
        IQ_PRACTICE_SWINGER,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_EXP_GO_GETTER,
        IQ_ALL_TERRAIN_HIKER,
        IQ_HOUSE_AVOIDER,
        IQ_SELF_CURER,
        IQ_LAVA_EVADER,
        IQ_ITEM_CATCHER,
        IQ_QUICK_DODGER,
        IQ_NONE_2
    },
    // Group J
    {
        IQ_ESCAPIST,
        IQ_STAIR_SENSOR,
        IQ_PP_SAVER,
        IQ_DEFENDER,
        IQ_INTIMIDATOR,
        IQ_HIT_AND_RUNNER,
        IQ_WARY_FIGHTER,
        IQ_GAP_PROBER,
        IQ_CONCENTRATOR,
        IQ_MULTITALENT,
        IQ_PRACTICE_SWINGER,
        IQ_MAP_SURVEYOR,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_SURE_HIT_ATTACKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_WEAK_TYPE_PICKER,
        IQ_ABSOLUTE_MOVER,
        IQ_HOUSE_AVOIDER,
        IQ_LAVA_EVADER,
        IQ_ITEM_CATCHER,
        IQ_ENERGY_SAVER,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2
    },
    {
        IQ_ESCAPIST,
        IQ_ITEM_MASTER,
        IQ_COURSE_CHECKER,
        IQ_NONTRAITOR,
        IQ_STATUS_CHECKER,
        IQ_EXCLUSIVE_MOVE_USER,
        IQ_ITEM_CATCHER,
        IQ_LAVA_EVADER,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2,
        IQ_NONE_2}
};
